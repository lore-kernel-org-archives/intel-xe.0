Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B39C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 19:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE5889A1F;
	Mon,  3 Jun 2024 19:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M18cez5x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD97A89A1F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717441603; x=1748977603;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GJije21ojfd8vbKsBGY3oUfF4Xuf0/FFbO0z5M4E9Pc=;
 b=M18cez5xyFwWq11nZuoqRBO66nv7pliuB82sqTUvJ2BE5D+2gR/q0tQk
 bvR6emhCbIuZ83HqM1U3buP/ZBhVKjLwhHoV8AqOsdbPqBVWiFnOvIOa6
 ud/PtiVsK2OE7dPl4YIIj90FOuW9wvnUcIUiLQWcwYT05g6twSYJN4nfq
 nTIXgrlH5of5Fr9utvDcudTLynXalB+g2jgm+yEV8xlHyqjkNUnbz82kX
 zkaAfE5RMsQP4JhoZG9z8bxeu8qiHCKJGJl1S2fbdVNk9uvSIIx2WQ5LU
 GCqbxpUNqJ3JK9GG1S7kwr++8npX/ECq3Y4cRfDXH620Wp3AcaL3RQ7rw g==;
X-CSE-ConnectionGUID: RIFfUX1dQ26AhFyshDwTog==
X-CSE-MsgGUID: 8IdjQleeSrSsP2UFG+NnAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13792609"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="13792609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 12:06:42 -0700
X-CSE-ConnectionGUID: 1s2KvstkTpWXux+0HU7hQA==
X-CSE-MsgGUID: Ow9JTGZLTOGGe1BHiAlZbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36956340"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 12:06:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 12:06:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 12:06:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 12:06:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLGvL1Xfu67UiC5xwDGnAKhJwoikAnwGtUfSGBAJVVkzQzr5zhMno2H1fN83JqPDljOe9tQFVor31gfiuBewNuvRxJrMldXClfrbifmbcrLuulJR7aC+yXRmJeMWc2XSxzz6EGIgj/fhSOlFawz6B51CTpNltSZ1MLmvyhpZOSHaaYz3O3J+UOgiErCPTwtdlptGbx767HYNYHTqth/2XS9NhUf5pPIRPSPPL+KR0idHI3YU14FP4j0wFyHhE6tIF8Bkjy9gINhRNq7LrHEJlJCvwEUZw0fF9+UM6bIXQIcKBCMmUv+YNv1EIuUl6uThXisv1r5PrFdOrr0+eB4E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB98LhdJWhYTXCQhdTjW6UBVK6f4SVbfDcM1Vhfs4EU=;
 b=VPIy5CokDd/RDGunwISsxiIfo4aYjTyGSpfGh+LPhPJmCKQnMpEeTFeIXojMGDaFsQ6SDbNLAv7k1MrH79toiotOD/4Wt66yIIERVaknGC+6nCiEHJdC5+6YY+U54u2VQRsP3gK1Dg4XjhjiVl8eNa4BO0Rp2jB2enpCOIxR8T3unkMWx/pCo7SOnYx+160QAEQD1gxLK0DZXrpx/O1Sir+DgRScnEQ2mrmXIo6cb1hORd8QZxf0tw/mn0S9xx6XeKrry/JDxO0R9BfdRU8MQwCsxnVofhAXnmJnGKbNqlD8fPJ130Y8EACXgs9I2qe7n92CMTHVEIx7HRRjp/ZdUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 19:06:37 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 19:06:37 +0000
Message-ID: <bd32e680-e4ed-4269-a634-d97b2dafd968@intel.com>
Date: Mon, 3 Jun 2024 12:06:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Request max GT freq during resume
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240531214232.3026621-1-vinay.belgaumkar@intel.com>
 <1a85d036-42a7-4cd2-b015-98e7378461f9@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <1a85d036-42a7-4cd2-b015-98e7378461f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 12bb4608-2746-4840-d320-08dc84004607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzFRUFpJR3BEelBSa2JjYjBUTFRxWW5rMHRSUm14Q005aHpaZmlvaHQ3Q243?=
 =?utf-8?B?SGZlTzU4Vno0QnloTk1RZmJvOHlvSi9SYTliWEZ5bE5sbFkySU00VDcxUzdl?=
 =?utf-8?B?ZE12aWZObm9jd2dwb3BmTlU2UmcyS3RKUitxcERUQTRCNlFkK2xlZnhoYWVL?=
 =?utf-8?B?UXdXQ29YMkV0MmN5YXR6OFA4eXYrZVgyZWM4SHZEUDRTcHFqT2ZVeW9JWHVs?=
 =?utf-8?B?TmFQK3FDV3J3WlRVanBTRlNuSFNpaG00SGs5VitFZXFEMndVd2svWnJ2QzJI?=
 =?utf-8?B?Wm5XcDlWdG1NU21OeWFQWjJWNU5RaUc1aXhwY0hkRXU4NDBqOEp2enJaMWZj?=
 =?utf-8?B?L1NwR29hbEF3bFZVd2hzcjhhVWl1UTdwUnBIdXYwakRZcmVtblV1VTdTYmR3?=
 =?utf-8?B?dnRneDFSekxEMzE2T3MvaE11cnpqYUIvMGZxZEtldTRtbVZpd041ZUpGcjNH?=
 =?utf-8?B?Q3NPK09IUStkRm9lT3ZYeFFVSlpvSnRlSUxoK2lGdURFQXp0WndhWUdDcFNa?=
 =?utf-8?B?ZENkSE9mS3pHYk5qNG9iOUFqK21kK1RsZkVCVHBZV2JNRjJPTGFhdWdETW5u?=
 =?utf-8?B?djlYQ0FFWDBJVGVYMGNNSDdaQ2UrTmI5alIraURCalhSS3I5M1laa3k3UE9F?=
 =?utf-8?B?cGdoNkt0RVR5WmVvdVdiOE11RXlNSzdWanFDZFhvM29JY3ZyNjFiUnY1WmY2?=
 =?utf-8?B?YU0rNGR3c2tYcWNWT3F4dm91cllVNlBSTGd3Um9jbmVaOUlHcmNOanVNb1Rl?=
 =?utf-8?B?akVwbHZzTllHejVPL2U1eW5qYTdLa0Q4T201ellOQTRoRUlKL2J1V08rZEQ5?=
 =?utf-8?B?R2x4SjdvREtQeEdTb25zMEltTnJRWm11bEYvd0Q0UWdxL3VtZk0yRXdnQ2RO?=
 =?utf-8?B?ZTZZTVFJTXhOcllVVzU3MklIMkhJTmFsRTZzUFJxYzJXMWJrNjNYL3BnOWk2?=
 =?utf-8?B?ME5hbU1iTm81Y1JUcnBXM2NyZllmR1hVb2theWVtS3Mwa2NTSHBvZ2g4L1dr?=
 =?utf-8?B?SnQ0TE9zaUpKSWV1WXkrWkx3clBzZEo5eHVha0pOSk5RT1NJZmtvWDEvUmE3?=
 =?utf-8?B?bFZXVmEvL3RFbTRGUitLcjRRQ3VZVlBrdFRJUGpucE1JYnZyUEJuSjhZYnly?=
 =?utf-8?B?L1J4QzdpZnREdkF1UmU5b3IwUDlDWUw2TnJoaXhNM0tCUkp3Snp6RDRaSC9o?=
 =?utf-8?B?c1BLMVdGS1hRSUtScnNlQ2kvL05YYmM5MFI3dDljY2c1bzRLTHVyQlJ6VEZQ?=
 =?utf-8?B?elZGdC9EUmc3Umx1c1RoaWpRWURTamd3bEIvZFpERCs0L1RoaVlSMlVRKzlG?=
 =?utf-8?B?cmx4S1BNNzJxazExNFBsdUtvR2gxd29ubEs4WjRPWU5DMmNCN1ZBYmJObkJQ?=
 =?utf-8?B?SDBVaDljNHc1aW50cFR6OHYvbDNTT1l3OWlzRkpPOFZBL0dkdkZETWhZSjBo?=
 =?utf-8?B?bmlOVXRPRmgrSFlmQ1dROTV6NFJMakVtcmdJSVc0dUhFQS9KOWNZaUJUUkRx?=
 =?utf-8?B?WmN0Nlhvb2FCMnYzVDd5SFMvU3FTM1FUbW0yVHNZeVE1WkZtVDhuWjFHWk9q?=
 =?utf-8?B?YS8yZ2lXWVArTW1zcTlYT3d0ZDMvWGNVZE15SDhqbzFXNHJ5WHptRlExRU81?=
 =?utf-8?B?cm5hMDBpR25iN0RBb3Q1WHJ1RThrOXR5SzhYYWJIWjMvRjVpTUIvY3dQdnls?=
 =?utf-8?B?VmtQcGVvV3FCWndGMEM3aWZtRzlQYnpGZjJTSDNCLzJwMWREZ1hGS1pnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmtGRjU2NHJweWM1YTdvT0pzVGIwYVJLWko1ZTA3Y1Q2MXBJdWxzdDB5bS93?=
 =?utf-8?B?dUpNZ05OaDNncmNqUmh3REpHWno4ZmpvekZya3lldUFJN0FodFJSdU9WM1lZ?=
 =?utf-8?B?K1gzRVo0WlBWRkNyVGZBVXNyWXFMU09qclBZSWRiT3psYlFXRTNkV0k0Ky9q?=
 =?utf-8?B?Y1hxOXk0Qi9rb0Q5NzVwNTVUWEhMUm1TaVlGVHlkczI0TG1GV05VcnB3aTR4?=
 =?utf-8?B?UkxLc1E0cDZERWNablBDS1h6Y0RwMW5YNGRuQ0N1MGQwWWZEWFhSQmJEb2Ez?=
 =?utf-8?B?YXEvalNWOUdzT01XdlJLdUd0WVAreGhYTGdYaEREY1BXUFhxY0hZYTN1MDZN?=
 =?utf-8?B?YzNpR2xGc2kzTzVoTXFqVzhVZTMvb0RySEsydTlYcXRSeG1ZZU05RUVXZHRB?=
 =?utf-8?B?WTgycnIvSTRsUk9STmdjK3FHWFlNYXpHbFd2WmhuQWZDNmc4YVp3OUFwZWNt?=
 =?utf-8?B?MkdDblJwSEFFbTVGNjl1R2RmMXhhV29JWVdwd2pVTDIvUFkxL3pvQWRPbnlO?=
 =?utf-8?B?dmtVYy80ekZiY3JmZ05GQm5jcjRmbDlWTXlrTzk5WUdPeHdneEJkZWRMYWN5?=
 =?utf-8?B?ZUdVMmJrOVY1Tk9IUXNKcS9sYmZSVmZubHA3TXFnekUyOUR6cnBDRUVSNCs4?=
 =?utf-8?B?ZC9Ob0lGNmpublFUR2RIdlBrbFhUaEpCZGhyNlFkM0xZUWt1d2NkdkYyek9r?=
 =?utf-8?B?Vnp1bkNNK3FaVnFPNEVEUjdyK0tTbHEzZ3N1U2dFc2VndnVaSFlHTzJFRjJH?=
 =?utf-8?B?Vk1HcWZ2UU9Pbjh1ZkdIT3B3VVBBWE9EaSs1R0wzWWVYS3JkRXlrak4yeW00?=
 =?utf-8?B?MTNCazczbEhnYXBaNFVucGpQbEpVRldKVVM4QzdMdnptYXAydW44OVVXMEZ3?=
 =?utf-8?B?R21vaGdDendReHdQR0RoNHRwS0RUK3FWZ2N4ZXhjSGtia3VGOThqWmEyY3NJ?=
 =?utf-8?B?RllTbmtLM2hBNGJYRDhnaEMxaE8vaWl6bVRhbDVPL2xpQktuSi9aVjFTR1N6?=
 =?utf-8?B?VEw3Y0VsTVZuMVU3NGx4bUtTL2k5VllDaXg0NmwwZHlEaTFJU1FXWXZ0V0J5?=
 =?utf-8?B?UEpLQm1lejFxdENjMldGUkErbWdrZXdSRVZ4TFpMRGd6dU9lZG1CUGZnNUpL?=
 =?utf-8?B?YzJxcDlUR3U4TGZZSGxyaHRpU0N6UG1XQzl5WVRQbS9oTnFIbStUbmQwdzA0?=
 =?utf-8?B?eGUwMVBWdmRXSHVWNlRFdTNxelRXNnVVekZHR2NPcmJwYmU2YzNyRUZwK3BU?=
 =?utf-8?B?YUZtVzJIVFpkZ3NZbzg3bFRNd05NSGJtS3A5dWk2VDQrYVJ4SGR4ZFphZnZa?=
 =?utf-8?B?akhJVkcrRDUxOVVsczZEa0hNNGFXaGRBUlgwTGFUUVF1dFQ0U3o3bm8vUHlZ?=
 =?utf-8?B?ZVZFa0picGd3eW1HTW9Ra1VCSGxTa2FsYlVXUzF3ejRSZDBRTlozY1V2c2Mw?=
 =?utf-8?B?c1BkTnVBOHBSYmpRN1Z4cExLbkREZDhwbEVWY00rR3Q1dE5aRWNnOS9OU3ha?=
 =?utf-8?B?Um90NXNtb1pJcVZsOUorQ09RZXpEYnJnYU0zTUVrMWtqdytoS2Ntbm5ncHlX?=
 =?utf-8?B?RFo5aDVrU3pTb0U4bmRJRkR3Sm1VVXI2eStOWUtHNEEwV3BTRHFOUit4OUtu?=
 =?utf-8?B?UVRveEpiMWFWVlpUd0c3Szh4UUY3RldwdGw3dnlQS1BuWDZkZnVUZEhwdVla?=
 =?utf-8?B?QnpuZjF3eno0VUlGQ0ZsaWp3OEtOb25UQWVWVHFtS3VuQS9LN2FvajUvS0ND?=
 =?utf-8?B?SCtsQU44RU9xeEdRK2pRQjNNdERJN0xxbWZZRlR5ekZvMWR6L2xoRkxxTW15?=
 =?utf-8?B?OTd0S2N6RStPdXhxVW9wMitXM1RlOGdaZnhuWEd1b0RXYmZDQ1A4WkZpWE1z?=
 =?utf-8?B?SHZMa0JwbFNndXdLWGtlWjJIakZTd2haOVcvc002bkJWSE51MkFCT1VwU256?=
 =?utf-8?B?YStJdmJZMkZpK3FGVDR5cHFLQnNBR3F5NEZLdFYxOGRWdGhpNnVuOTZkZG51?=
 =?utf-8?B?QXFaYVRyVjFRaHlld0FURTVPRnRBZFV6YUFrLzFvTWtXcExCSmx6WlNMSGo1?=
 =?utf-8?B?VDJtNnI1TWgzdklvcHZNL3RKYUxGLzFLN3E5WmkxemJ5Y0NYc1FYQmxZOTFh?=
 =?utf-8?B?cVBQdEptdHBSMDAvT1JpclNRZ2VzQ2FqNjRBUUVjWDRGR3labW9SQUx3ZWV3?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12bb4608-2746-4840-d320-08dc84004607
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 19:06:36.4304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC8qbODUdkFFL5j7QwxPClZEiUyolhE6skt2HfFGqWHlTqFUCHN7KcskfsUzEEGpe51xyYQPGS7GExHKmfI/kdY1sakfET6fJbK0Gritl3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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


On 6/3/2024 8:28 AM, Michal Wajdeczko wrote:
>
> On 31.05.2024 23:42, Vinay Belgaumkar wrote:
>> We already request max freq in the load path, moving it
>> to __xe_guc_upload will ensure this speeds up GuC load in
>> the resume path as well.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index f7886c00af01..63e1b685bd4f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -694,6 +694,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>>   {
>>   	int ret;
>>   
>> +	/* Raise GT freq to speed up HuC/GuC load */
>> +	xe_guc_pc_init_early(&guc->pc);
> maybe it's just me, but usually we were using _init_early() name suffix
> for functions with some early, one-time, likely software-only
> initialization, while here this xe_guc_pc_init_early() seems to be doing
> something else and now it could even be called many times

It is initializing the internal variables to the fused frequency values 
as well. It is still being called only once so far. This patch just 
changes where it is called from.

Also, as of now, I don't see any other location where we could call this 
from. If that happens, we can rename the function.

Thanks,

Vinay.

>
> maybe it should be split/renamed to xe_guc_pc_boost() or something?
>
>> +
>>   	guc_write_params(guc);
>>   	guc_prepare_xfer(guc);
>>   
>> @@ -779,9 +782,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>>   
>>   	xe_guc_ads_populate_minimal(&guc->ads);
>>   
>> -	/* Raise GT freq to speed up HuC/GuC load */
>> -	xe_guc_pc_init_early(&guc->pc);
>> -
>>   	ret = __xe_guc_upload(guc);
>>   	if (ret)
>>   		return ret;
