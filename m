Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D960C3DA45
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 19:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BDE10E170;
	Fri, 12 Jul 2024 19:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsBbn0sE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AC510E170
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720813731; x=1752349731;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D9ktvP7TSG4HeOG3FbiheboPUznHQy+xcPqOc2TQ7NY=;
 b=XsBbn0sEw4MF5qEbJaRDbrrQ1A4KyDM3qjVrZ+MsH5Xya/1rMwnsbBjx
 bCvbbteEh2M+hy8mrRJaDbAr13qFGShSC7eMv3pQ0I0Ca158Fd59EzS1o
 4g0lG5VT6vcRxoHq2Fey8MYdhKEwlYOYB0uPOLwW+Ftz/qomCARW24m6r
 gHp1hmozlSR1bRfFShN0XxxDiP4EC0KR8Uvstejild5pRBLq1vP966XNV
 xs3VuWbvmcj7IPa/lP9pp6Sbc04grqNN7ejljWSdTxW80qcg6o3GR++vw
 6KjwQS3rBvp5fNFbs1sba1CAYwvkKzN82A6H5p+ELBPaPvlUVC4DP2vtf A==;
X-CSE-ConnectionGUID: T4HO44qaSpKiTpoF7dKqCQ==
X-CSE-MsgGUID: qJG+RTCDTTGcup6fMBO5pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18222514"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="18222514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 12:48:51 -0700
X-CSE-ConnectionGUID: iZxqcKpqS/mckzSoHe918A==
X-CSE-MsgGUID: j6mHsagcRz6OSkL+xjT68Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; d="scan'208";a="86516290"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 12:48:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 12:48:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 12:48:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 12:48:50 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 12:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXaXNk1aIKJYPjOOc2xhFJrEHkYj2EZ11NbzLfHECW3YV2WObouiugzvalNhapAfNtRDnWfLu30bMIFKM/iAx2WQqWzcqewuI7lM94MBcRPiabFaFpRB2GjBMI4ivWMoh48wATmmErGWNNukab5YgizcrT1IktbieDezj0v7NLx0P0m8I7qZYn0hMXQnAn4oy1bHWSaSz+CLGOJze2sgFbJQ2p2z70QfxIiUG5owEIyMfWxpg28GSQj0Hr1S2722PoOlRuxIFTQV2nnl39xaeH9v1Ax85ldG1B5pYtm7CJzChboHXeXo7yzDIONFh3vqu0JLcoszAHiwlmE0QejHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xohkrnNlz4ynx4spNoqtka1dYKJixkrqnu8ejzZ6fK8=;
 b=YXeQ+EqYgku3xfruHzW16FhiRgyVu4ecYMC0ehyzn/huPE0AthJ+v4eW0PY01NEaJiBENlGvtIQkOjFQm4XJWcgZF0klMdUJP7oMNOze4IVb3u70yFNVrYKnQxYdu/at+9+LRPrD2ln0DMMShC3G5Z/rlnGguvIv3xzmajLJ9ttFrunqnxgHeI7Mi/tjmDilIR51GjdMHU1a6+qOUKUrdd3fY6Ali7ESxGL7hIcoOeUVySmCbh+1AZeD/7fvHNs/PR6ss2finJicMUnZ23N+bDTeFzGHZj1PvQ+FwmQbH37qRS9JiCZycYwR/BhDuWogTgbD+I72RzIcVS17gA2euQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 19:48:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 19:48:44 +0000
Date: Fri, 12 Jul 2024 12:48:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Robert Krzemien <robert.krzemien@intel.com>, 
 Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/oa/uapi: Allow OA config's to have arbitrary
 names/id's
Message-ID: <ZpGIlkSx6V7Wwttz@orsosgc001>
References: <20240710011741.3589516-1-ashutosh.dixit@intel.com>
 <87h6cyxdbs.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87h6cyxdbs.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:303:2b::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 20ae56fc-f45c-4be5-d105-08dca2aba317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU5ZajduWHgrOVA5aFN5Wmh4ckpBRnl4UjEzYjVtSDJoNkZGQjJmM0syOENF?=
 =?utf-8?B?WDJHNEs1aVkzTml1ckJYeWFKcXdWR2ZOaktoTUxVSzE3N1RtNnVUVUZSOG5X?=
 =?utf-8?B?TytBc3FnVHNvS0xIeDBIS1hPQllxVTZZNmk1czZvSUJFVHc3VjI0LzJSVUth?=
 =?utf-8?B?eW8xQ1pHb0F4MjFOaVEwKzVVbDEzdGZIWGRQcUhvTk1mYWUxcisxWEJxcmxV?=
 =?utf-8?B?RzcwTWtZM0dTNUY0YnBFQVBVanZMRFJwRVJlb1FGM0JFMVhkQkxIM2tVa21q?=
 =?utf-8?B?RVFDeGVCZS9sZzJ2cE5GVzVDWVdlNGVUQWN2RXRDcEVRckVzRXJENzk1NGpB?=
 =?utf-8?B?T3JuZkVLSWs0VXdFNlRUZ3F3S1ZWbStZRHk3L1JDRnExNDkwcFFkREt6K2cv?=
 =?utf-8?B?a0R6a2NENFdZRW83Sm8vMjFBQXZwdEcrREFNMGZmYkE1d0xGT2hoVWg5SEdj?=
 =?utf-8?B?eDJKS2ZtS0FhWVZ0d2RCRmRLSlBzOUNJTDZQM2dxOTNwWnJpNGdoMjhvcGtt?=
 =?utf-8?B?OTRHR3JHTUdsL04xNm84WTQwSkwzLy9MT0gvcHV6d2ZJV3E3K0o1MTFuQ21N?=
 =?utf-8?B?c2ltVDEzOW5HcitRUU1kbW82U0JnVU11bFcxdUhZZHBneVV6QzRDV0c1dEZI?=
 =?utf-8?B?c3JML2RtYVdhT2hFd3JaM3Uvc1VNakMvRzRxRFlKZ2V4cjV5MVNUQTcrbEE1?=
 =?utf-8?B?Z0JIRmM5c0x3c001SUdpZEpCdWJjR2lNb29kQUR3dUpqdS9FR1F0UXpxT3hI?=
 =?utf-8?B?ZVE1cCtsWDhMa1pOZ0s2eVlqWVVVdGp0T3pOWFJzVXpuc3lxd1dEMnVYMnQx?=
 =?utf-8?B?eFNPODQrK2RYU0FQK1hSaVprdk1WRU96UDgwaktscjY1eHkyUnVhNkNmM3VR?=
 =?utf-8?B?aU5yUS82SWVGbDRLK3dDTElRLytOTWxMa0JPcWdrZTg1T01HaXNxc0VtR0VK?=
 =?utf-8?B?djdBakI5V2lPVHlrdEJwMElHS3Mwdi8yelQ5UkxESm5IV01xelAwYkN3aWpk?=
 =?utf-8?B?TFdLUzlCTy9BdDU2YjhramdtY0I1bXUvcG9XdC9USGpvc05yaFpYcW82Z0VS?=
 =?utf-8?B?RWVIUzZldTk5WFIxcGFQMlU1YlFqYW5XVytOVnVicjVpUGdaaDVkQ01RaC9y?=
 =?utf-8?B?WUdyVEZBWGNieTk1ckVOU3oyTFc5QUtuV2xJWjg0aWNleGhHU045R0lhN2U4?=
 =?utf-8?B?M2JITU9OaXA1TjFhajk5M3pSdFp2MzZ2K2JHaE1HQ2dFY282RVNpNWhsbDNh?=
 =?utf-8?B?ZkZMeDZNN05PMCtXK0czOCthaWNyay9uOEx0aTl3UzBwdVRkMnNHSmFjRUhQ?=
 =?utf-8?B?aDFVWHQ4ZGFiRDJva0xrSXZPalFHWFYvM2xWelFCeWJMVFNaOHRnVDYzVFc0?=
 =?utf-8?B?Y0JmZmw2LzRkNW1xVWdjNi9BNVErMjZLWWZNS1F1aGFycmJ6d0FtTTZ4Ym52?=
 =?utf-8?B?TFFwV29mSVhva2FQQ0ZEa3hwdURHSENNM3loV0NxdjhKUHE4SUV3a2RwVHhB?=
 =?utf-8?B?UnliblBzamlCVE1Kam92VEJLdzZVbHduUEcza3phdXFkSXFLaVJPQmZVeHJm?=
 =?utf-8?B?Z0doVnEyMGw1Tm4vQ3l0VG5rd0M1Z3VGbmZNWkJPdWd2MGNZQU5mN0NXVDcz?=
 =?utf-8?B?cTJ5ZlpqUlB5aXJJVXI0NXhqSHh3aU9vdlN1dUZFUUx1NityaTVhUC9BVXQ1?=
 =?utf-8?B?U1pUSkZDTmViKzhRVVBvczRWS3o0ZE84OFFJNDlPa1M0eVQxS2xIcEM1ZTFC?=
 =?utf-8?B?R2RLRkVMclZFMVorNUhoSHVjd1EvWmtFaGJLSElaRUp4a2ZhaERzUTlHN0ZN?=
 =?utf-8?B?MmJhdmMrN2ViL2g3S0NRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlGWUlGcTZSWnlHOUFVTno1cmVvRWtkVFdDUWl4RG1BRlVKSmVuUXlZaFJE?=
 =?utf-8?B?L0gvam1YdFRGb0lKRmM0YTZrTjBHY0lXQVVhVnBZWmFJeFBVc2NZK3hBWUJr?=
 =?utf-8?B?dWhvV1I2emo2c0doUDAvVlhEaTVyRlRCU1J5OXA2ek13ZlorR2N1TmJIVFVS?=
 =?utf-8?B?eWVYaHYwRi9henBsTDg4cWRocmptYVRuTVA4ZzFUQ0cvSDdJbTExMXljMFhC?=
 =?utf-8?B?eGdXZmdSQ3BNVWVLbnFMUzQ5b0RXRHNBelNpMkNyV3lRWXdxQ2pwUGtvWU5P?=
 =?utf-8?B?UUxCMWJjaGJVdmFjVXRHZkZ2M3ZBbHo4anViSWs0MG43dGhReTRDQTBYVTl5?=
 =?utf-8?B?MjV1Q2pIYkFiYytSRHpmUTMyczlGZmEvNDZZd05wWEFIYUI3cWw4WURMK0N4?=
 =?utf-8?B?YVBBSjAyazZtVEV6YzNubTd1YkdhT0F4UEdmd2JFbDN4MzBxVlVRSmtPR2JQ?=
 =?utf-8?B?UHlSak9TUjVTdzUzR0xETCs1clpOaVFCUGtWZHVZL05NaEdydW9CNittWG9i?=
 =?utf-8?B?dWFyeHJ0L3Zla2ppRWdnRFV0Z0pvSzJQRTUrS1FWUzlnVHdIVCtRS2RRQ0Iz?=
 =?utf-8?B?di8yUU9TQk1Sbjg2V3MzalRqTFR6b3gyay8ycUdHTnBmQ3NhcVVyODFaS0Zn?=
 =?utf-8?B?TGxSbXlrMWdQTzFXdStPM0k5SERzbWpOcWJtTjRkaHIxdTc0em5qT2dpWjdh?=
 =?utf-8?B?OEhsM1JuWVozQjNtc1ozeUdTNnFYeXlveXcvM25PQmQ4azNzaU1SZVdtcDZ0?=
 =?utf-8?B?YUVmR1hiV2p5Mk0rbkkyREpocjNCNHUvU1JDckRvbm83bGxCTzN4SFhZYlVa?=
 =?utf-8?B?QXkrTXFBTUkxS0Z5SytwY3V4VGd4dHprSXo3S3RmYVZWSVZobmpsc3p0V3g3?=
 =?utf-8?B?TC9qeGtjWEx0ajJJSSs5SktuN041VnEvaFBDR1hNS0VsZm1DYk9PNUxhSUhk?=
 =?utf-8?B?QjM3c3dhbE9qOFE1ZVZ0d0RYbXcvUEltQWRlcFc2akpydDRXNzFQTlgwK3pQ?=
 =?utf-8?B?WTZpWWxGVW1EVWNGSEowSUdvRTdVWStyYVlxajFrbXZyZDdQSTEwNWwrMGJk?=
 =?utf-8?B?RERrM1ZlUC9XUmZoRUxJYlRKdDJTdDNoa3pLWUpzazFTa0hEdmJNTURTVzJP?=
 =?utf-8?B?OWdYYVJMdFQ3VXgxWUpPVW1TamhDV1JQN2NnYzRlc0pjanFpU1dEZ2UwWnZv?=
 =?utf-8?B?VFFiQ1hvQVhjRGF1Y0gyaDUwaGVqMk4xaXQ0RnpWb0pNaFE4WFlzME5CTkVJ?=
 =?utf-8?B?TXo0ZFhBN0lPSFBCOE1ES09JenRiWXpOb3hqbmo3TzdJUzROK0ZrS1cwb0hJ?=
 =?utf-8?B?emxHcjJ5TXRSY0x6MCtKckNzWVkveDBtRFZ4WnFSRlk3UEs2WFdmeko4WGd1?=
 =?utf-8?B?Z292MEMxT01sU0d1bWRmeVZHN1Y3MnJZajNQd0F4MXU5dGtmQjhXS2NKaHFZ?=
 =?utf-8?B?OEhCbXRxaVR2WncwREhMWjJxcFJjZnQ4UmIzN1ZzVVlFUjdSNmZKRFlkZHIz?=
 =?utf-8?B?R3k2MWNjRGlIZSs3Y3F6K001S0VES2NWa3dHWXhLTmI0cHVsVlhJdjhYMkdS?=
 =?utf-8?B?aU16STN1VDllWitMc2wwL1RQb0xnT2FQcWhkQmJLZjlqZ2g5RFNKOTdPRGZB?=
 =?utf-8?B?ZXY3bmZoT2FFY09iMFdxVWxyTCt1eHdqZDBWZGoyaElJT0EyYWIraXBROGhI?=
 =?utf-8?B?N3FaYVYzbGpZMUZZOE42VEJ0Tk5pTHdCMk1qZHRsWldzbFdmYm5vSWZyVTA0?=
 =?utf-8?B?Qzc2Ti95WFRsWGRnbWlkc2lKd3lGcWxLbldvYWRoZGNpa0Z3SUxUdEtERHcv?=
 =?utf-8?B?dEVwaU5MbUhsZmVJLzA3NVNBdVNhNTFubk5HTU1vN1BJUzU0UUJWTnRSb0ZJ?=
 =?utf-8?B?SDdVM2Z2dVNDakJYVmkwOE5lU1VMdWdaVVlvUTBaMFNPYTdFQ0dYYnAzdjli?=
 =?utf-8?B?bEJwV1FRUVNmWCtwbUl3ZVpBNW94Vi9LNkYwd1ZGcldBeG1yU0FLL1d5ZlIx?=
 =?utf-8?B?WjdkRGgvbUtiWE8zeC9kVDIvYzVjVmcvL2x1a0lYdWZBZHlpRXphUFV1RWth?=
 =?utf-8?B?bGttTmcwVWdSUm5MYWNFQkRSQjhhZDhkNDRRU01IY1BqVXRSNGlhdGdiQjlN?=
 =?utf-8?B?RFhwTE9MY0RJN2pEemtTR0xlYzhybUozL0QrMFhTenpWdlAzdU52VFF5TjZ5?=
 =?utf-8?Q?EDxRT4JTaTrMQaasKhlZ+F8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ae56fc-f45c-4be5-d105-08dca2aba317
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 19:48:44.0670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPMZ3xwMXqZMYpL+FlAMtlxonIxJ5ievCl9iXCSNLdQcRkSZloa3LPeve0+bfq0FHmFztdKjlcGUTzwAQij60/rqkPJBVixKaZkntSRrzls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7777
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

On Tue, Jul 09, 2024 at 06:09:27PM -0700, Dixit, Ashutosh wrote:
>On Tue, 09 Jul 2024 18:17:41 -0700, Ashutosh Dixit wrote:
>>
>> Added OA configs were previously identified by means of a uuid. Rather than
>> forcing userspace to use uuid, here we generalize this scheme to allow
>> userspace the flexibility to use whatever naming scheme (including uuid)
>> they may wish to use to identify and track OA config's. Names must still be
>> unique or will be rejected.
>
>To provide some additional context for the need for this patch: at present
>multiple UMD's can add OA configs. But these UMD's don't have a centralized
>place to manage OA config uuid's. Therefore, OA configs added by one UMD
>are incomprehensible to the other UMD (since they both use their own
>private uuid, even for the same OA config).
>
>So one solution to this problem is of course to have the UMD's coordinate
>and use global uuid's across all UMD's.
>
>If this is somehow not possible, originating OA config's do have another
>globally unique identifier, "metricset name" (such as RenderBasic,
>ComputeBasic, TestOA etc.). So if we allow UMD's to use this "metricset
>name" when adding OA configs to Xe KMD, UMD's will be able to identify an
>OA config added by a different UMD. So the "metricset name" can serve as a
>globally unique identifier for OA configs.
>
>This patch allows this second solution to be possible, without preventing
>the first solution.

Looks like this is related to vulkan performance query as well as some 
support required in containers (for the same query or in general?). Can 
we get some more details on how this Vulkan API uses the perf-configs
query and what's the relation with containers?

I am not sure we have any use case where different UMDs would want to 
query the configs though, so not sure if we should spend any effort 
thinking about that. 

Regards,
Umesh

>
>Thanks.
>--
>Ashutosh
