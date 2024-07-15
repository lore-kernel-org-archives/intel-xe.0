Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C88C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 15:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CBE10E42A;
	Mon, 15 Jul 2024 15:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpYkJo3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019510E42A
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721058331; x=1752594331;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=V7tJ0YFXi9r4dn8exSxywLHCfK+hBmnhzMTSUPShnbk=;
 b=CpYkJo3Pnutbv4JhDzIbbfOD4NO5W7/NYu4EDoogjuTN3o0GOto/uZkb
 zUoB3QGsYkiJItVi25G/r8luVPc6vBuB49gfie7iOkMC7qugZ4bKTpSa9
 WSiuGm55RrilI2ehUgsEOMkc238X6QOJUQJgKIaS4Vv28mxkNciHnuGIM
 Tkqg7yXHkXEh3no9ZDx+aFPRzk8Y71ueLhyq7aK+MyH1teS4DhKHT0vTG
 vNTdFUs/C1RpzN8pGgR0hWDZm0iZJHV2lI0UnOAVhoQs6dn3OiKB1p2oX
 8g2ae4v59vfSjCLV1+6KDhvGguiyX+Xx6dwAj6RRGRhsDixQNTAFaXxGa Q==;
X-CSE-ConnectionGUID: O/afDPf+Qj6ejWuKazEhag==
X-CSE-MsgGUID: Ge6X683pTxGV1RCaqWiEfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18256958"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18256958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:45:31 -0700
X-CSE-ConnectionGUID: 0QgXNV45Riqm/YJrYRueyA==
X-CSE-MsgGUID: dehE1fMHSkiBAN43nxvreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49750843"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 08:45:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 08:45:30 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 08:45:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 08:45:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 08:45:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSuugeShVpoYNI0xY6F3IkwERh3vAhbF9Rz8y7FyMJTtrYiw2g67G9cmMXBabGC4252/SDl7t2OVQnTeBnPAboZWnPwGG5ExlfMZWuBRBwL52MAO1DqrrPNpBiUWGh20bCUF3ZZ66gpn/iIy6PUWwwRr+BCPy8m5MeXegaLGWaUFC7xeQnPsKrIX81lJH6AHlNp06YXdOUcfCu/YQQKuR7u9yl3DYPQfnR1KEXsk+34kh4RTFWam91Df4jvec7uqCJdSZkTqKlJc0L5iX+TC3tzpQuEaH2YOkAb7GRV1mu0l58K2qDg1AMMGtxdhjqa6Qw5ojbaL9bp5TTTxkRhOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uWAJzrvahjcNm4r5mH4H65S0r/YYK5FCt5sZoaDxos=;
 b=otj4HrEJl2H91PVjvN1FHDaeRkHcPj4ETjq0KBbxH6S29VDJmgjohKWIBlCSDajx3GLZyRMEycWZHS1wFjQ/GfDz04NBjnf/9ybr49udyVN3xssBnEfm+s8lZJe+14XchUNY6hiMsFL2wttoN17WebOUCSPeT9O2VYe4Xi5AO0eGxZ0g//T1XEy0lnJ5RPBY9wxTgQTMNKPYetHiSkay3Kf6GfIJQDUaljf7TRXguIsltw+Qf1l1+qKZEFAzpTgkrBXHkhWqt4go7oAgck2Upz7vhwGWAK73b25XTQ0geC6QgZ/2izJibNF7cJf0Qgz4Ri2pvQbKQrrRe7UsTpdNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6452.namprd11.prod.outlook.com (2603:10b6:510:1f3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 15:45:26 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%2]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 15:45:26 +0000
Message-ID: <eda088cf-147f-4037-9943-18ef3dc40ebd@intel.com>
Date: Mon, 15 Jul 2024 11:45:22 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v12 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240712164724.677393-1-zhanjun.dong@intel.com>
 <20240712164724.677393-2-zhanjun.dong@intel.com>
 <34bd59e5-f921-4ba9-9ea6-5a2ab1481ffe@intel.com>
Content-Language: en-US
In-Reply-To: <34bd59e5-f921-4ba9-9ea6-5a2ab1481ffe@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eae3751-7175-4a17-1379-08dca4e525a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWhnMEZTU0tGNzJFeDVTRXVDdHdneHdoTlkvd3piZmZTbm1XN0FNa1VVUm5B?=
 =?utf-8?B?Q08weC9yWUo4aFF0aWVXTDVjdmwwNWhacHJmaHZONHY2bmZ0aGpqTFBpTnZN?=
 =?utf-8?B?SlcyQmdrVEJ0ZzhSRFRCZjFkMFh5ckJ5Rk4wOXRwTjBzQ0hzYnFXSnV0UjZU?=
 =?utf-8?B?b1BLd3oxUUkzWFQ4VG1SOXVoTzlIZ2lkOHFTOTNpVWw2VTJVUUIrbFZSUFRa?=
 =?utf-8?B?LzdEV0VvVWtSM1Rka2JFekoyZmd2TTEvdmpneWNHZzMzbUZhN2RFbVMzdzBT?=
 =?utf-8?B?aFBIWUthOEZEajU5cEtud1NpcGs2RWZRaXZUSXBqcldFWDgrMUlGcE0zNThh?=
 =?utf-8?B?eEQydmMvbzNOUUZtVVRtcmVTU25oZjV2QXV6VTRpSzhTOWd1QUszV0FXejdO?=
 =?utf-8?B?ZFh2WDQ1UzFEMFZkdUx3eDFET2RrUG93NmFUb3lJelBSZ1VhTlVhSXEzdVVF?=
 =?utf-8?B?dFVXc2ZyZGZaVG5adjRBNXNXSityOFJXUkdaZVVrT0dWL25aZUhobVpQZzN1?=
 =?utf-8?B?VVIrNHF3VGk1K2VDZzZBVS9ZVmhIUXFCak5ETk12Q05pM01DWFJzODNOT2VO?=
 =?utf-8?B?OEkxd1lGTVJIdVp6R1VENUdRYjljdVhOazRPVWpJbXU0N2cyTVAxMk5vd1pD?=
 =?utf-8?B?NVR5WVhFS1pqM3dWN2prdUR5Q2l5a3VQRnhmV0E2S2tNbDJkU2ltTXFZMUw5?=
 =?utf-8?B?WE9yaitSeEJ4THRINm56MFZ4Yjl6NW9pKzlnLzNJbW5Wd3JGalZnUXpWbk1J?=
 =?utf-8?B?VmFzVFYzOXovZndDeHlsbVdVZE1TNFFSVThEM2N0SFlvb2lpWW1kbVVTaUdo?=
 =?utf-8?B?WnMzQjBEK1hKUFhxMmtkUm5sVzNUZFZkYzMvaENSQVpjT2c0SnNtTGlUaERy?=
 =?utf-8?B?Q1c5UzliU094UGNnbnlHcDdiekJYZ1o1SFU5Y09wRW1taGhDUlA5RzNTT2F2?=
 =?utf-8?B?V3dHWUVNR2RZVXdpbFNxRmorTlQ2cDFPNThsTk5GOHE2QlFrR3k4UWRzMzhq?=
 =?utf-8?B?T0lUTHNLZnVwUm15TENmMHdUOGE4dXNNYUZkcCtmc3hqMVEyR2lleUpUcTdy?=
 =?utf-8?B?S2pRRURTdUxmWFRZSUgrUWVldG9uemFXeWozTkgyUzFJRW9nZFRoYjRPSEVO?=
 =?utf-8?B?S3huUE5kalphM2JHNmFJTmo3eU5XR09XdEZYdkJ6cVRPanJCWVNQREhuS25D?=
 =?utf-8?B?K00zS3VIblFLTCtvdEpXbSt2WVgyTm1uMnkxbE5STEZWbUYyZ1NVT256aHhJ?=
 =?utf-8?B?WnF2eW1mNnFwKzUveGxIcHV5bytudWRtQk9jVFhsRlV6bFNrVzRXMHZKVGRD?=
 =?utf-8?B?b2pnVGJqazdmTDJVOVJkNzZZMVZlZTg3VWVhbklvTFBXa2tXejAxT245Ykll?=
 =?utf-8?B?Y2ltRzQ4TzZBKzZ0aXltSDZxTU9va2FQT3Y5VlIrL1RCYTZMWUdiNGhiTGRE?=
 =?utf-8?B?ajNtMm5BSkxIaThYTGFXNGN5TjJGeU5NRzRGeVpjR0Zlc05ZWFhEa2FIZTU4?=
 =?utf-8?B?dUlBTUU1MmdOTFR3dytEVDRVaVNBSU9kSkxOcEhQakxIbjBmdUVhY21XRlZW?=
 =?utf-8?B?cHFCVTlDWWdUempReFVzL01JQWRTYkNkQmM5TEoxeTI5SnFVajZwODUzRXhR?=
 =?utf-8?B?WU1QYlJBRHZEOHBCSDg5akVBV1NCR2FtaVpJdVhHNVpOQ3lSQ2c1WDZXcytx?=
 =?utf-8?B?VndpVmkrRUJEVzJHdVpHT3VHVzlNZ2Vva21vMVhXSVBnRFlBZzlSeUhqcmlY?=
 =?utf-8?B?WHBLQ2JuSHBiREYvOEIweWpxeTJSNDhIWEtFYUJIbW1EQk1vT3VTQUlvdGc5?=
 =?utf-8?B?MjJKN1VaQmpSVXNrRm8wQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckZwM3hDWjJQTExtTEVhMzB1WVAwbndtL2wraGpSanFYMVNyNm0yUHYwbzJI?=
 =?utf-8?B?YzdjMkFrUVFOMjNlaHYrWm9RcW1yKzJQNDZBSlFIMXRNQTNkZ2xidDVscjVJ?=
 =?utf-8?B?NlBqZ0ZOcjUydHl5MEZzanNBUmk2UWV2STdiTHB4bHFEaFJLaE9XZmhZaVFj?=
 =?utf-8?B?VFZBNE1mNkpjSnZ1d1pQZTFpVVBhUy9UcHdXTnBMYkNrWXFWcnJSeGhUeUZU?=
 =?utf-8?B?KzU2aldiUU1lMXJvSnZYdlUxaW8xaGxoK2dqL2lpT0JBaFd2d1hTeTJvRzlR?=
 =?utf-8?B?NlJGLzhkc0VxOFYwWVJzRnBiSGwvMDMzK0pWZHNXS29qT0lyZ0hBOGdTOUZ2?=
 =?utf-8?B?MVE2QlEzMUpUQWk3NTNwOFdYeHRxbSs0OUpOaitrSWM1Szd6VEtYR2NraVk3?=
 =?utf-8?B?cTZlcFh1b0UrS2Q0WWwzc3hXa1BCREFWc3krNVlJVnc1emhCWTkrWEpKVGY0?=
 =?utf-8?B?UkdRY2FxSG12ZmdJVTQrcldZV1dBTDVPK2VVa2E0Q0xOdVphZlJNZmUvdkY0?=
 =?utf-8?B?aC9neUI4OGM1NHRXblNqT1prd0piVnEvbGZzZkIrSW9LaXV4dFEwTGVSbVht?=
 =?utf-8?B?OGtkSnYzMkVybm1rUFp1MGtwNFRUOTY5amdBVEZpcTNmVkZyNmdnNTlXU1FE?=
 =?utf-8?B?RmJDRTl6S21UaXVKRUc0Nng1OG5MUUdFMmVERTNleUo3WG9ydDFsd1ZTVzZM?=
 =?utf-8?B?UjNVQ3VoL0ZIQlNsYWV6SUtsKzlQZmtFSkhUbnRManNFU09iUERCVktCL0sx?=
 =?utf-8?B?R25pcFliS0dGWUZpTFlRODBuY2hkQWZLVmxCNUxieVp5dEoxb0tSbXdiNDVZ?=
 =?utf-8?B?VVIrVmpuenk0b1YxUGVoY1k3elpPVjVxNllzWU1VazRycmZ2bGQrZ0V6OGhy?=
 =?utf-8?B?dG8zQXVNbEI0ZzMzS0JSc3RRR0J4ZWxpYUh0RDBVaE0reFI4TlpHNHJ3eGdO?=
 =?utf-8?B?ZkxVZEtQV1hFang4SnVaOHJPd3dZbUxUeDZVQWZrSWVrZ2IrdS9ZajBNSm5q?=
 =?utf-8?B?dlBPZjA4SU1hN3Fyb1NNRWNyRklIcUU5UXQvb2lyS0hwWTc4cFVLM3kzakxh?=
 =?utf-8?B?VWQxU3N3SHc4S0JNV3dVSGpNWmhaSVRXRmxONUpmbDNNVUNHZkp1VEdyY1Q2?=
 =?utf-8?B?eTFXMjd0WlZSSzFJZmtkcklJWVNoR25HSTlSSVkxTzd6TEhsTWM3R0t1TGVu?=
 =?utf-8?B?eTJ0R0Jna0xoOEkwTElkL1JpWSs5RVJSMXRLVnNDbE82cFJTM3kvRnBVSzYx?=
 =?utf-8?B?MGZ5WHVOaUV4b0xKalhlNXo4aUlJVjFUSVNqSWFsTzZJNEJoM1pMZkhmczgy?=
 =?utf-8?B?N2ZDTmJIQ3FFUFVMS09rRjFHcEhVL09ubWszalh6WndJZUNxdWFvUUhNMUNi?=
 =?utf-8?B?SlpYeDVyaDZTMllBTU1iQ2FlR291dGZDUFB3dU9nbzZyVlVBem1NYXBKejhR?=
 =?utf-8?B?MHVNRHh6cEFpSkNzdklhT08rRVVwcTh1aGFqQUhBK25BUk5zQ25vRE5KVW5B?=
 =?utf-8?B?b3V3WGNqWnFIUkZ0Q0lwTW90UnBsOStvaVBjNVZPWnlCcFJqUU5OUkJEKzQr?=
 =?utf-8?B?c252VllwSUdVd3RjNzJCaStUS2tNQmlhbklNUkFqQWthZmVvcUd4dXVvVXpu?=
 =?utf-8?B?bTBVRlB3SE8zcXNyOHM0NWtCMTMrZkRTdUMwQmJjcUprZWkwRXpwS09DUHo4?=
 =?utf-8?B?Rk1QLzlVKzlBTmNDZFBtelhTZ1NHaHVXT0QxTEhMZG9MZW1qRFptSXBBOTVn?=
 =?utf-8?B?MFZqemF3Zno5NWp0TWhtRGZYd2pVVWVkS3Z4NDJYK3dxOEJTQkx6TFllcFJM?=
 =?utf-8?B?R2J0MG82WjBOODhaNTR2T1NDMTVmM1dsVXc4YUROc05saldiRlRHNHhIYzlU?=
 =?utf-8?B?Vng2dEx6TlovWEZoaytXN0lmMlozK1JTUFgxWWNtM0NPTk5mRURXenQyUkd2?=
 =?utf-8?B?SkRTYy9BajdSTnBid0VKWCt2MjJjV1IyLzc5dG1zbVpUL2lvY3BFNmcrZ2hJ?=
 =?utf-8?B?WTVVeVNSbVdpeGNsTEdTSXUweVFqTUcyL1diUlN6T295Nm1ES095clhWYWQ3?=
 =?utf-8?B?aEpYanVoWm1Vd2lYNmtMSzJ6Wm15dkZYaXhRY1RkT09sc012b3pUTXdhUlBi?=
 =?utf-8?Q?Bmyj568j4yQ5YHeMNdZWf72Pq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eae3751-7175-4a17-1379-08dca4e525a1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 15:45:26.7252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyaLhHJLU8ABQzlugLXUzwQClV0/zlML6zFVPZ3mRsul4K/lNpIdi0fQoh1mBusthTzj+bbr63xABHeSXen1MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6452
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

See my comments inline below.

Regards,
Zhanjun Dong

On 2024-07-12 4:44 p.m., Michal Wajdeczko wrote:
> 
> 
> On 12.07.2024 18:47, Zhanjun Dong wrote:
>> Add referenced registers defines and list of registers.
>> Update GuC ADS size allocation to include space for
>> the lists of error state capture register descriptors.
>>
>> Then, populate GuC ADS with the lists of registers we want
>> GuC to report back to host on engine reset events. This list
...
>> diff --git a/drivers/gpu/drm/xe/abi/guc_capture_abi.h b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
>> new file mode 100644
>> index 000000000000..c71630aed49b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_capture_abi.h
>> @@ -0,0 +1,144 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_CAPTURE_ABI_H
>> +#define _ABI_GUC_CAPTURE_ABI_H
>> +
>> +#include <linux/types.h>
>> +
>> +#include "abi/guc_communication_mmio_abi.h"
> 
> hmm, IIUC, "capture" uses ADS data and CTB communication, not MMIO, so
> this looks like a wrong header
to be removed

> 
>> +
>> +/* Capture List Index */
>> +enum guc_capture_list_index_type {
>> +	GUC_CAPTURE_LIST_INDEX_PF = 0,
>> +	GUC_CAPTURE_LIST_INDEX_VF = 1,
>> +	GUC_CAPTURE_LIST_INDEX_MAX = 2
> 
> IMO, this MAX shouldn't be part of enum, if we want to benefit from
> using enum as index
The MAX is part of the spec:
"
Values:

GUC_CAPTURE_LIST_INDEX_CAPTURE_LIST_INDEX_PF = 0x0
Index of the PF capture list.

GUC_CAPTURE_LIST_INDEX_CAPTURE_LIST_INDEX_VF = 0x1
Index of the VF capture list.

GUC_CAPTURE_LIST_INDEX_CAPTURE_MAX_LIST_INDEX = 0x2
Max capture list index.
"
Spec put the MAX in the middle of the macro name, I put the MAX to the 
end of macro name for easy to read

> 
>> +};
>> +
>> +/* Register-types of GuC capture register lists */
>> +enum guc_state_capture_type {
>> +	GUC_STATE_CAPTURE_TYPE_GLOBAL = 0,
>> +	GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>> +	GUC_STATE_CAPTURE_TYPE_ENGINE_INSTANCE
>> +};
>> +
...
>> +/**
>> + * struct guc_state_capture_header_t - State capture header.
>> + *
>> + * Prior to resetting engines that have hung or faulted, GuC microkernel
>> + * reports the engine error-state (register values that was read) by
>> + * logging them into the shared GuC log buffer using these hierarchy
>> + * of structures.
>> + */
>> +struct guc_state_capture_header_t {
>> +	/**
>> +	 * @owner: VFID
>> +	 * BR[ 7: 0] MBZ when SRIOV is disabled. When SRIOV is enabled
>> +	 * VFID is an integer in range [0, 63] where 0 means the state capture
>> +	 * is corresponding to the PF and an integer N in range [1, 63] means
>> +	 * the state capture is for VF N.
>> +	 */
>> +	u32 owner;
>> +#define GUC_STATE_CAPTURE_HEADER_VFID GENMASK(7, 0)
>> +	/** @info: Engine class/instance and capture type info */
>> +	u32 info;
>> +#define GUC_STATE_CAPTURE_HEADER_CAPTURE_TYPE GENMASK(3, 0) /* see guc_state_capture_type */
>> +#define GUC_STATE_CAPTURE_HEADER_ENGINE_CLASS GENMASK(7, 4) /* see guc_capture_list_class_type */
>> +#define GUC_STATE_CAPTURE_HEADER_ENGINE_INSTANCE GENMASK(11, 8)
>> +	/** @lrca: logical ring context address. */
>> +	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
> 
> keep comments in one block:
> 
> 	/**
> 	 * @lrca: logical ring context address.
> 	 * if type-instance, LRCA (address) that hung, else set to ~0
> 	 */
> 
>> +	/** @guc_id: context_index. */
>> +	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
> 
> ditto
Sure, will do
> 
>> +	/** @num_mmio_entries: Number of captured MMIO entries. */
>> +	u32 num_mmio_entries;
>> +#define GUC_STATE_CAPTURE_HEADER_NUM_MMIO_ENTRIES GENMASK(9, 0)
>> +} __packed;
>> +
>> +/**
>> + * struct guc_state_capture_t - State capture.
>> + *
>> + * State capture
>> + */
...
>> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
>> index ef538e34f894..219b40063f43 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h
>> @@ -6,6 +6,29 @@
>>   #ifndef _ABI_GUC_COMMUNICATION_MMIO_ABI_H
>>   #define _ABI_GUC_COMMUNICATION_MMIO_ABI_H
>>   
>> +#include <linux/types.h>
>> +
>> +/* GuC MMIO reg state struct */
>> +struct guc_mmio_reg {
>> +	u32 offset;
>> +	u32 value;
>> +	u32 flags;
>> +	u32 mask;
>> +#define GUC_REGSET_MASKED		BIT(0)
>> +#define GUC_REGSET_STEERING_NEEDED	BIT(1)
>> +#define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
>> +#define GUC_REGSET_RESTORE_ONLY		BIT(3)
>> +#define GUC_REGSET_STEERING_GROUP       GENMASK(16, 12)
>> +#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
>> +} __packed;
>> +
>> +/* GuC register sets */
>> +struct guc_mmio_reg_set {
>> +	u32 address;
>> +	u16 count;
>> +	u16 reserved;
>> +} __packed;
>> +
> 
> this ABI header is for definitions related to 'communication over MMIO'
> 
> your additions do not fit here!
> 
> move to guc_ads_abi.h or guc_capture_abi.h
Sure, will be moved to guc_capture_abi.h

> 
>>   /**
>>    * DOC: GuC MMIO based communication
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index eb655cee19f7..5e108cedbdc5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_throttle.h"
>>   #include "xe_guc_ads.h"
>> +#include "xe_guc_capture.h"
>>   #include "xe_guc_ct.h"
>>   #include "xe_guc_db_mgr.h"
>>   #include "xe_guc_hwconfig.h"
>> @@ -338,6 +339,10 @@ int xe_guc_init(struct xe_guc *guc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = xe_guc_capture_init(guc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	ret = xe_guc_ads_init(&guc->ads);
>>   	if (ret)
>>   		goto out;
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index af59c9545753..a823c5b8ab22 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -59,6 +59,30 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>>   	}
>>   }
>>   
>> +static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(uint class)
> 
> we don't use 'uint', use 'u16' or 'unsigned int'
Will change to u16
> 
>> +{
>> +	switch (class) {
>> +	case GUC_RENDER_CLASS:
>> +	case GUC_COMPUTE_CLASS:
>> +		return GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE;
>> +	case GUC_GSC_OTHER_CLASS:
>> +		return GUC_CAPTURE_LIST_CLASS_GSC_OTHER;
>> +	case GUC_VIDEO_CLASS:
>> +	case GUC_VIDEOENHANCE_CLASS:
>> +	case GUC_BLITTER_CLASS:
>> +		return class;
>> +	default:
>> +		XE_WARN_ON(class);
>> +		return -1;
> 
> if you want to return -1 then function should be of type 'int' not 'enum
> guc_capture_list_class_type'
To be changed to return GUC_CAPTURE_LIST_CLASS_MAX(defined in spec.).

I am thinking to add assertion of "capture_class < 
GUC_CAPTURE_LIST_CLASS_MAX" after these 2 xxx to capture class helper 
was called, while the XE_WARN_ON(class) already exist on hwe engine 
class to guc class and guc class to capture class, make the assertion 
seems not needed. On the other hand, as the converted capture class only 
being used to matching class type, it is safe to handle the value of 
GUC_CAPTURE_LIST_CLASS_MAX.

> 
>> +	}
>> +}
>> +
>> +static inline enum guc_capture_list_class_type
>> +xe_engine_class_to_guc_capture_class(enum xe_engine_class class)
>> +{
>> +	return xe_guc_class_to_capture_class(xe_engine_class_to_guc_class(class));
>> +}
>> +
> 
> and wouldn't above inlines be better fit in xe_guc_capture.h ?
Sure, will be moved to xe_guc_capture.h

> 
>>   static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>>   {
>>   	return container_of(guc, struct xe_gt, uc.guc);
>> @@ -69,4 +93,9 @@ static inline struct xe_device *guc_to_xe(struct xe_guc *guc)
>>   	return gt_to_xe(guc_to_gt(guc));
>>   }
>>   
...
