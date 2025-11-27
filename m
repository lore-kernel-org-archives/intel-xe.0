Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CD4CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 11:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A00710E7DC;
	Thu, 27 Nov 2025 11:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQjYl8st";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EA910E7DC
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764241230; x=1795777230;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fYV+0x48GTFtqw22c08sZSfQvjjpfyxxUG6UukjHNqo=;
 b=CQjYl8stilgJEr+vxkC4RKrO9PW8uRaCSDQLxpeK62xtlqDJsDm+Jeo+
 OGUryNv4F7iDKLCuJDvanMEJr3YKnLtSqzrlpigAfD+kQbiFZSi3eEzIz
 eSsoxG+bCJcjg64vUznuyz38uFHMYUAhonmRTToJEml4RcUukNoIM4+9h
 IFCzD6DLpH/wIsO25GEFge1BVSwpN9/6P/vTb4LWFU4vvVJppYbwEqvvD
 lGy01/D1H3dKC/rRRX2LfLGEfOzxa1nPFZwwAnIjMqDsvN1VotliOQa/g
 O1YXvJtOz5jp2LRRH+2+tYDRbkGs/hAud+QPnUnVlg7aqEFbhYwAQ6L1P A==;
X-CSE-ConnectionGUID: PxPor6ZzQlu65fygtgomqA==
X-CSE-MsgGUID: ZWAqj6H3S6inc/JAdk4OSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65998564"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65998564"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:00:27 -0800
X-CSE-ConnectionGUID: Yb1Hxq/xS5KQmcf9acZmHQ==
X-CSE-MsgGUID: DfH3P1IfTmOu/c7xKnirJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="192326658"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 03:00:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 03:00:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 03:00:25 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 03:00:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0mIjNpXRBxVRa+MSFTnZkZpdkf3NOCDqmw+07S9TlRvVgIOVynjrVtpRuadOrBQDf6gpKB2LmPjq4hapmW3r6HitK/YfvGY4kuFOKTif21TwzxO+2GM7/2M7qkiHMi5KSo02saN2ZNRSp+u+osWU3olEQGU5NGa4ZIMYehZT8U9ZzNDwwCFSnnC1RxkY1foEsgI/RU0dugQpfGwpqpwTeW5U+KIvdhm7LK1fj4+gCwGoUzbd2CKEEV1+8p98IHVH+xctEDB2PLRNcpKiACHUT6YEwYkw06p9VL1MfiL4x/jq7XsPnkHaPI37BB2Np1AqNwkytH8RG1Pze83NiHPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0uaOE+R/0N+eroR7D01zhxtnaenXeKZ7vHQ7yrh8s4=;
 b=yMhWjORiFmS7mQ10FQWTK4KBbiKQe+6grtbYwzR6wuW/LMOi9e34adA1JPCLyKhYlu49+jcVFFuhq9rwscyInCgLvqnk6/Uak/wI1JRKN9ZqbkJmtpUFDa8X2sN74BQJzfCORI98JwSc9vjUV1ftRhkxnroLXd6SiNynJF7MnZx5mzqAncCPlQ112uVjkINvTeXZ3gwAdliQ7eBy2zurpI2MZDwmTeejMzHGOxkqQ03eFaOsroIHttgfrpANgw5FkEU3YUEycpMG99wV/wR/Z384UaemDdET4Rx8qxp8mWX7uVSK001DZlj/XFQucrPOlNuD917scxYWJAHsZlcBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 11:00:23 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 11:00:23 +0000
Message-ID: <fcce0fd8-330e-4a69-9d11-9bbd85cf04e1@intel.com>
Date: Thu, 27 Nov 2025 16:30:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Add tracepoints for VF migration state and
 data transfer
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20251127104131.591299-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251127104131.591299-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::12) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 69cb7df4-c97c-4011-c4b2-08de2da429e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUZTZVNEZHYvU3VoR0JxaGRTZDVlMzI5L3BnUWplVVNrZEM2blNYSGkyRXFR?=
 =?utf-8?B?aFcyRDdoVkRwVkxnd0Zma0s2d0NCMlFsbG1IVDRzTkZEVXhlWmRKcEJWL0dZ?=
 =?utf-8?B?VDdrYTcxZEVid0lxOUEwSFpjWjNwN3U4Y0NER2lrSUg4M0tJb3RjS2lOR0FL?=
 =?utf-8?B?b1hXZVpZVzUyVk04cFFSZi9nOG1zTzdwbXpqSVVoT1lac2NEV3RWWm1wNDRK?=
 =?utf-8?B?U1o4dmNBdGJ1dnpKNjVZQUI5bTk2L1laSUVvelZmZi9abWdwTGtKeGRvT2FJ?=
 =?utf-8?B?dVhnMG1yVGVtd2FYNmwyZ2FIMFU2ZVhMUG5vb3lRYVlUOWcxS2JXZFJzWWhB?=
 =?utf-8?B?SWFqOTlsSitKOThGQklKZzZBTXhPalJKRzZYYTZHeHpYOFg2aXZGVEd0V1Rq?=
 =?utf-8?B?a0ZDRG9qcmxSTW9yMkdIeXhjZXdpTGxzUE05S2RrUk9vRnc1STJDWFpMcHpW?=
 =?utf-8?B?QjZXNWVOOGR3OVp2Z1RhcWdWWVBKcnB4cERxTEZlYVpISmJuSmpOVWlrVTIw?=
 =?utf-8?B?YTBWK21sWVI1enYwOFhOejhGRXdFaGFNTlRHNFdUR3NPd3NROWxpekQyZ0ND?=
 =?utf-8?B?NVhYZFkyMVdoUjFvb0g0T3crcDRRZm92cDcxSUJzQi9vdEd2TmZ3Ynh2dENM?=
 =?utf-8?B?RkNScUROWHdZYVZGVWMxM0JPTmpjQW04ZlArcTFVRDlsRTlzNTFNQi92cG85?=
 =?utf-8?B?RkwyODFPZG9NNlZvK2c1TFNEUXNmT0FzUE5qTnFTU0kvL0N0Y2EveTBnVnhY?=
 =?utf-8?B?Zko0UTRmdkQ3cmI4OWl2a2pRZlFJdUlISjkralhxNFRUc1hrMU81dC9VUUd3?=
 =?utf-8?B?ZGcwMkNYajVzZm91VFYrTmwvSkZJMURmRDc0ZU9hMW5rWm92NjRRK3FpeG9C?=
 =?utf-8?B?Rlh2Y3hyVi9Fa2xqdGNJUXZqUnZMTlh0SmVYNlBzT1cvdW9jVG9IODJOS2pm?=
 =?utf-8?B?QUdEYTZuWlNTekxaMDBGcFdSQ1VOQkZYQXJKVUY2YklhY0U5RE5NdDZKTTMr?=
 =?utf-8?B?WlREZ3FhOUN4Y0diV25PeUpRb3M4ODE5MGYxQVU2ekN5NDgvUDJFdWRSOWVQ?=
 =?utf-8?B?MUN1V2FOTDJLbUtDT0R3RXJLamNvQTNZNmJWV2xad2JyU2tzYnl5eHNLRWsx?=
 =?utf-8?B?V1VGd050aEMvbHZYdUx3WFl2aXR0dndHWGZMNWR2dUtFd0FnT0UzK3VTU3Jz?=
 =?utf-8?B?MTdpSmlhU0xFL3Y2RGFBZTFIS1hHTCtPbGRMT0F0Zm14cjhjaWIvRnl3aDFK?=
 =?utf-8?B?emhPclNnWjVwVm40OGVqc0IvVk54d3JsbWhnMjZjNnRiSXRGVmZwb2VMZEhK?=
 =?utf-8?B?dnEwdGhQSnZ3b3ppczlSMFdBWXlkaEZOZVVXcFg0Mm1kTFpJNzFldFNIMmYw?=
 =?utf-8?B?QlNuTmFMOTVmdy9vVlZCamI0eUp2UHJDaFFwL2dZd1NZdnRCNTVVNmRzeVNQ?=
 =?utf-8?B?dXBoNy93SVZpQkdYSnJ2R0dJeUQ5WVBPWW5KSHlUZ01BUmc0NWRwY0UrelBm?=
 =?utf-8?B?SnorWTdmOEFvQWszdktVaWxZM3owb0VRWlphRUtyK3BESzMzVmdLWW9aTW5F?=
 =?utf-8?B?YkY3ZUpzdXVWbk5SOXdWQWJpYS9CNFRmVGlKdFZKeGdxV2E0NFJlNW14ay8v?=
 =?utf-8?B?dGNuTFlaalZCVU5PWDIrRWR1VWxwNDAwQXhldjhSM1EwV0crVkVOSEZCR2pO?=
 =?utf-8?B?TTErcExFNDVPWTJaeDVkaHhjZVBtUUY1L3JvYkYxRENwMmdwalEzd0E4L2d0?=
 =?utf-8?B?cHpmcy91cVpDVWJqRUtnNE9wTWhDQXY1aTVSdjZ1TGFnUTJ0Vys2dloxQ2cx?=
 =?utf-8?B?Wm1nQWMzRFZ4NzlEbXBpOVVRQnVwb0JGbmI2UmJGem9SbVU2ZTR6NVZkN3d4?=
 =?utf-8?B?UGFKOEZNQkFxVVRHQXRWZlJhbUZTQVlocGE0b3U4ZzdnWmllTmkrNi9BMldo?=
 =?utf-8?Q?bk95CH40lRzMQevA1QIt4Eekpn77UROi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtRcmZkQ1dONHE0dHhnTGRwdDR6cGlHYjdrVGludHFSbXpDL0Z1OHRrQTc2?=
 =?utf-8?B?VlJXWEJzc2ZFRCtLSlpMd0NtNGJtQm1VWFBzc3NXVERaUllIb1NyU2U1aW8w?=
 =?utf-8?B?ZDFlY3hYS1Q0Z2E4ZXMxQS96dTNsTXVpVVlMZVh5eTROaCtrN0RldVBqem1Z?=
 =?utf-8?B?MkZuSFdmUnY5QWwxSjhhLzdGd0p2MFdJNU85Y09QWDgreWI1VTZkUDE3UHZN?=
 =?utf-8?B?dFJKY3FXdUhXSnNQcTMzeGp6U1FwajNPQ0dsaE9LWEVpMnkycjRrWWVnUnlH?=
 =?utf-8?B?TUZTcHNUNXZmQmpOaVFMYndtVWY4bUdkY2FhOUY1UDFPa2FSWmsyaUpTSDZr?=
 =?utf-8?B?enBvS1NDZDZmbWpodURDejlaZWxMZWxYV0k0TkFKaDVlOFdueVVGU1k4RUU4?=
 =?utf-8?B?R0xyZ0J3c2Q1ZFZWMys4ODk2Szk5VVdnLzJORm1SREtoOUxsbjFQWllNWEhJ?=
 =?utf-8?B?NzUrbFJLVGlHVVpFelJUaXVzeFc1S0hqTVphQkVoQS82MVlHSCtUTStFdWVi?=
 =?utf-8?B?cVgzaHFWd1RYRVE2L3F2SVlSRUtDRENaeXJsMGlFQVB5ZkhqbmRlMXYvak5N?=
 =?utf-8?B?MjFTc0hLN2NoaEprOUZ2T1oxOERsSVpma2dDaU1tOEpEWUQ1a1FQanFpSUN6?=
 =?utf-8?B?dVJOTEc4b2NhdkdvaFhkVlgzcGtkU1ZoWENZajVaUmNPeEFETmlkWUcyaW1I?=
 =?utf-8?B?WERJK3dRRHhDcHpxenJ0bU1uL0lVOEZRekVuczVYdHl2M0NseEVyR1grMUxn?=
 =?utf-8?B?WG15THhYOHpGNVFsTEU4ckFva01mbUw4TG9rMG5PVVByazI3eG9oV0RVOEVk?=
 =?utf-8?B?WUl6OEs3Q1dscmFDZ1N4SFFlYzNWQ3IyeTlWVzZMcExOOXd2TExQODlteWM4?=
 =?utf-8?B?NVE3Z1hlbytTQUt4Y2ZJRTBTSVFaNUFoU2JwOUt2MWZ6T28zdGdpZHd6U3dN?=
 =?utf-8?B?bytlQ2ZSR0c3dCt3KytaR0VSZDE5aThNdVk0RkcxUWsxazRjbzl3QTRJTlVT?=
 =?utf-8?B?YUlvdTd3eGRqVFV4NE1ONVEyUVNUL1YyRnloQnVnWkVpbFMwOWdtdTFxSVV3?=
 =?utf-8?B?VzI5M2QwY0NKK3RKd0lCcnlSUEFrQS85aU1kbUt1Y0tZSFM5SFc0cUtGaitX?=
 =?utf-8?B?Y1dKejNGYWNiK0tSWUNsODZ0TStoekphRTZpS3ZzOTk1SERTTHNjU0hKSVRj?=
 =?utf-8?B?ZGV5b2wvWFk5UC9vZGhxMU9Bd0F6NVl1d0J5VklxaGR4NjZBSGFnN3lnNHhN?=
 =?utf-8?B?dlhqTEFFeXZ4eXlORFBLNkdXY3dIM3NLVkl4NTBMR2RlUW1nc0hXeXBPRUtQ?=
 =?utf-8?B?cUJpeDIzM1lFTm9ZcDBFOUE0RlM4aFZrN0UxTStna3R5V0UyenhhU3dPSEtZ?=
 =?utf-8?B?RDhoT3pTZkJ0K2ViNkI3Und2cUhRQU9aazhRVVRHOWw4QWdYWlNQQ3RJQkJm?=
 =?utf-8?B?TUM5N0dIMEY3UW9PQjlJeFRPTlVYRWxzWjhMVG1HNDNnTGpNc2JhT200UWEw?=
 =?utf-8?B?OWFiM3RmamU2WDlMbSs1M20xTjRtOEptNjRWL1R6UTlCUjBsbUVpTXlTRVg4?=
 =?utf-8?B?STc3Z0hPMk1JUWVkdEZiWlRMVkNXSjJMNE1kcG5xRzMvbDV4bzFDR3RoRTJa?=
 =?utf-8?B?THIrUWJjeW1RSy9HbUFEUFJLWjBXVTErdThkWlBCSzFVYzhRNWMwT1BFZzNZ?=
 =?utf-8?B?NHo1Sm1XUC9oRnBPdEZBcGthYlo2cGpSMWVVdEJCanZDMDF2SEtQZCtoSEw4?=
 =?utf-8?B?cEVqV2FId0tJWkx0eHoxdkRRVTZsbGZGaytySXUxdVY2cDZzeCtoYUhTaW9S?=
 =?utf-8?B?V3c2MGtxVC9wVzAzYW5wcGtOd0JOQVI5SVdJUjBzOTQwUG5ubHVwNTBWa2xN?=
 =?utf-8?B?ZDhhTG5iQUxLQ1pGSzlIanFyVENnUEdTMkZhUjVaYnhJSnZIZDM1ZGEySExF?=
 =?utf-8?B?WDdSc082T0dvOE9GUUkrUTltK08yMldUQ05HT3VaVmlnNjVDVjEwdlRtOEpi?=
 =?utf-8?B?UFRtN21USjgxWnl2clhQNkxyK0M4Y2ljanNhTVJEaTlWTkVpMERNNlNQWmxr?=
 =?utf-8?B?Q0NNMVBsRkhXTThjMUtOSTV2WDJQVnJ1N3d0N0RzbVd5a2kxZWNoTkUwdTV3?=
 =?utf-8?B?S0dMK1lNZlVZYk95eE9tWTQxV2w3cXRtSEJqS1I0WkowWTZ4SlJJeDEvZWV6?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cb7df4-c97c-4011-c4b2-08de2da429e6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:00:23.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAnzNmP+S8qzBn7XFjz5VjhFtI+P/2talBRYHWIkG/gSQ5qR4JpBlCCKHKDBp940NXH+99NAX+9zimMTKwVNQov7wKXX4lWnk33wPI8XFqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
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


On 27-Nov-25 4:11 PM, Marcin Bernatowicz wrote:
> VF migration currently provides no lightweight visibility into its internal
> save/restore flow, making it difficult to measure migration latency, VF
> stun time, or the amount of data transferred per VF and per data type
> (VRAM/GGTT/MMIO/GuC).
>
> This patch introduces two tracepoints that instrument the VF state machine
> and each migration-data producer:
>
>    * xe_sriov_vf_state
>        - emits the tile/gt/vf identifier and the effective VF state
>        - placed on SAVE_WIP, SAVED, RESTORE_WIP and RESTORED transitions
>        - allows tracking the duration of individual save/restore phases
>          for each VF
>
>    * xe_sriov_vf_mig_data_chunk
>        - records the type of migrated data (VRAM/GGTT/MMIO/GuC), direction
>          (save/restore), offset and size in bytes
>        - emitted once per chunk after it is produced/consumed
>        - enables reconstruction of migration throughput and per-type byte
>          distribution
>
> These tracepoints are low-overhead when disabled and integrate with
> existing tooling such as trace-cmd and perf. They make it possible to
> correlate VF state transitions with data movement timings and to profile
> migration behaviour under various workloads or provisioning scenarios.

These traces are useful to see where we are spending much time during 
migration.

Can we add some debugfs entries in PF which shows consolidated save and 
restore times for each component?

>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  8 +++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 49 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_trace.h                 | 47 ++++++++++++++++++
>   3 files changed, 104 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index bf48b05797de..de327ef14218 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -24,6 +24,7 @@
>   #include "xe_sriov_pf_migration.h"
>   #include "xe_sriov_pf_service.h"
>   #include "xe_tile.h"
> +#include "xe_trace.h"
>   
>   static const char *control_cmd_to_string(u32 cmd)
>   {
> @@ -836,6 +837,8 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
>   		pf_enter_vf_state_machine_bug(gt, vfid);
>   
>   	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
> +	trace_xe_sriov_vf_state(gt, vfid,
> +				XE_GT_SRIOV_STATE_SAVED);
>   
>   	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
>   	pf_exit_vf_mismatch(gt, vfid);
> @@ -944,6 +947,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
>   static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>   {
>   	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		trace_xe_sriov_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
>   		xe_gt_sriov_pf_migration_save_init(gt, vfid);
>   		pf_enter_vf_wip(gt, vfid);
>   		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> @@ -1113,6 +1117,8 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
>   		pf_enter_vf_state_machine_bug(gt, vfid);
>   
>   	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
> +	trace_xe_sriov_vf_state(gt, vfid,
> +				XE_GT_SRIOV_STATE_RESTORED);
>   
>   	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
>   	pf_exit_vf_mismatch(gt, vfid);
> @@ -1195,6 +1201,8 @@ static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
>   static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>   {
>   	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		trace_xe_sriov_vf_state(gt, vfid,
> +					XE_GT_SRIOV_STATE_RESTORE_WIP);
>   		pf_enter_vf_wip(gt, vfid);
>   		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>   		pf_queue_vf(gt, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index d5d918ddce4f..0e8f5e8e5d7a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -25,6 +25,7 @@
>   #include "xe_sriov_packet.h"
>   #include "xe_sriov_packet_types.h"
>   #include "xe_sriov_pf_migration.h"
> +#include "xe_trace.h"
>   
>   #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
>   
> @@ -86,6 +87,12 @@ static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
>   	if (ret)
>   		goto fail;
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_GGTT,
> +					 true,   /* is_save */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;

We normally give zero for save and one for restore.
Can we define some macros and use them instead of true and false for better readability?
-Satya

>   fail:
> @@ -108,6 +115,12 @@ static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
>   		return ret;
>   	}
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_GGTT,
> +					 false, /* restore */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   }
>   
> @@ -274,6 +287,12 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
>   	if (ret)
>   		goto fail_free;
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_GUC,
> +					 true, /* is_save */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   
>   fail_free:
> @@ -332,6 +351,12 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
>   	if (ret < 0)
>   		goto fail;
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_GUC,
> +					 false, /* restore */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   
>   fail:
> @@ -442,6 +467,12 @@ static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
>   	if (ret)
>   		goto fail;
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_MMIO,
> +					 true,   /* is_save */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   
>   fail:
> @@ -465,6 +496,12 @@ static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
>   		return ret;
>   	}
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_MMIO,
> +					 false, /* restore */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   }
>   
> @@ -589,6 +626,12 @@ static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
>   	if (ret)
>   		goto fail;
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_VRAM,
> +					 true,  /* is_save */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   
>   fail:
> @@ -672,6 +715,12 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
>   
>   	xe_bo_put(vram);
>   
> +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> +					 XE_SRIOV_PACKET_TYPE_VRAM,
> +					 false, /* restore */
> +					 data->hdr.offset,
> +					 data->hdr.size);
> +
>   	return 0;
>   err:
>   	xe_bo_put(vram);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 79a97b086cb2..0e714b754179 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -464,6 +464,53 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
>   		      __entry->class, __entry->logical_mask, __entry->guc_id)
>   );
>   
> +TRACE_EVENT(xe_sriov_vf_state,
> +	    TP_PROTO(const struct xe_gt *gt, u16 vfid, u32 vf_state),
> +	    TP_ARGS(gt, vfid, vf_state),
> +	    TP_STRUCT__entry(__field(u8,  tile_id)
> +			     __field(u8,  gt_id)
> +			     __field(u16, vfid)
> +			     __field(u32, vf_state)
> +			    ),
> +	    TP_fast_assign(__entry->tile_id  = gt->tile->id;
> +			   __entry->gt_id    = gt->info.id;
> +			   __entry->vfid     = vfid;
> +			   __entry->vf_state = vf_state;
> +			  ),
> +	    TP_printk("tile=%u gt=%u vf=%u state=0x%x",
> +		      __entry->tile_id, __entry->gt_id,
> +		      __entry->vfid, __entry->vf_state)
> +);
> +
> +TRACE_EVENT(xe_sriov_vf_mig_data_chunk,
> +	    TP_PROTO(const struct xe_gt *gt, u16 vfid,
> +		     u8 data_type, bool is_save,
> +		     u64 offset, u64 bytes),
> +	    TP_ARGS(gt, vfid, data_type, is_save, offset, bytes),
> +	    TP_STRUCT__entry(__field(u8,  tile_id)
> +			     __field(u8,  gt_id)
> +			     __field(u16, vfid)
> +			     __field(u8,  data_type)
> +			     __field(u8,  is_save)
> +			     __field(u64, offset)
> +			     __field(u64, bytes)
> +			    ),
> +	    TP_fast_assign(__entry->tile_id   = gt->tile->id;
> +			   __entry->gt_id     = gt->info.id;
> +			   __entry->vfid      = vfid;
> +			   __entry->data_type = data_type;
> +			   __entry->is_save   = is_save;
> +			   __entry->offset    = offset;
> +			   __entry->bytes     = bytes;
> +			  ),
> +	    TP_printk("tile=%u gt=%u vf=%u type=%u %s off=%llu size=%llu",
> +		      __entry->tile_id, __entry->gt_id, __entry->vfid,
> +		      __entry->data_type,
> +		      __entry->is_save ? "save" : "restore",
> +		      (unsigned long long)__entry->offset,
> +		      (unsigned long long)__entry->bytes)
> +);
> +
>   #endif
>   
>   /* This part must be outside protection */
