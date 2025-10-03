Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E09CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 13:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9362C10E90A;
	Fri,  3 Oct 2025 13:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNwA+CIN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD610E90C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759499273; x=1791035273;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Z4xzzB6Yx0GraE/8i8gyb7LXnkdMAhmAZTYGgHxvN/8=;
 b=FNwA+CINnj4MSgvsvyxRh1FaOYWeNQ7K9CrYlVWNPrrWV3fAnXIHb24v
 JMiYtydkw8UIR9RRGlgFZT3zQIcKfwh1+DeNXRgc28NtCcLlRlJUoL2E/
 A+OjCz0KslkJip6n7gK7OSBSLvYJNw0iSN85fTCP7LWJF06KGRBesbpzd
 QJcGZjlet8rjz2lWA62pwigxhjnBfCEUdPm5ZuCNCrDaaspiPWnlE9llG
 m7x2hJJAkE8GPdt7rHUeXP55p/Ew8nFNqh8bpLUSb31hNcY7ZKx6ffS1C
 HuPBSTYYjEdiP4B1HjUiamCxOOUxjEz6eBySXrQ47pK4dpluO7gXvm2bn A==;
X-CSE-ConnectionGUID: uksYnvacTmKN/bR8zl/VZg==
X-CSE-MsgGUID: s+4sNUSlTGSw+QPX2focag==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="79209055"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="79209055"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:47:53 -0700
X-CSE-ConnectionGUID: RiO6hnAJRLSfUKFPAdJdpw==
X-CSE-MsgGUID: LH81xz2aQLaQZwN75Opd2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="184489910"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 06:47:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:47:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 06:47:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 06:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjKQ34g74TTEA9uPihDNOCy17xvewuiI/56oVeLZbCz3Z3yA46QQuBCRDoVgmNZbopGoXisyqmesMXHm0f4X30XR+sQzhOOlPATM8zsa9jiAHT3tEPYaT9gte3pFPaGqkXyhx+f3r7whPAGXKDx1ywAIMTEVe3N+bAU5i00nvCT865j59pMd9JeLcmQY/3J6cPXl8+h5exxz+rVxoIiJ1BdR+pozmHXm8Wr4Lrrxh2dqV9FQ1mldNysttzvVoHY+8tF4A4l0Ak4p6lbe6MTly3Tn+pIPx8UXjpzIRNb63g5YjbfdVOfxNrOyOT0LKV97jjHApsRxVZSLERVG6Wbw2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKi0cgaX0V0uUYOT5zvZxG+TA55NjPwpOE1BpzRYXuk=;
 b=lXr1TsA1BjkBMRxkf6i76Nb27Xqf7rfT9BaB6GiZck6rr+1dsToLwXPWKAGHCraOvs3MWNOdI8SPpO6SgXTbcZ39mvT5avf1nYkgEWQE3NdFPAY5PByCFhItPRdjGfEazG6xDeXZ9+ehsnQ35vhpgfUc8OEkf4RgMp9Rg7G0UxHrx10x5/FyefHss7RmG20xsVMI23HoniTz+wuXce2oXtWsyfd64VVCC+blyQEHqy0odpHv3KODSl/44uccHdf7Do8zHzOHyz6rYTM03G1YeQde53MzVfWRUhXTN+qgR7aVx3P99+UTU8imYbOyvGT7Fm4fxDe1Q0Qw9Bz1k5HjvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB6294.namprd11.prod.outlook.com (2603:10b6:8:96::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 13:47:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 13:47:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-46-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-46-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 21/23] drm/xe: Break GT setup out of xe_info_init()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Oct 2025 10:47:33 -0300
Message-ID: <175949925364.812591.15261630203060870371@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7db19f-9860-4e93-9362-08de02836a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTdNNnk2TlVoeVcrZm81VSt5ME1RZVNwMDVSVUhGazdwWTBib3ZZcVVRbWVF?=
 =?utf-8?B?NzJBZ2luMy9nTXZwdFlybS9mYmhFWGp6WUJzbHNLdC9QTXZMQk0yNk9MeGR1?=
 =?utf-8?B?ajQzc2JsamhqRVR4NkNLaG9NUUIzbnRTZGNQZThlQXl1NzZZcUEzMmJnWFBt?=
 =?utf-8?B?MzRNeGxxQy9nSXhwdDZKd1I0a2pCTjJOYXFXN1RMZTBLRXN4ZWU3QldhSWFH?=
 =?utf-8?B?NTZibjZ2WUQwcHY0S2xkQ1MybkRiTWRSZWF5eVhlL3VzVENZL2NETHFucTMr?=
 =?utf-8?B?TTZDM1NhRG41aE1YelNHSGJzZVZ4Vm4ySUNPWjBLb2NiSnFXaHNhQnM0RWVh?=
 =?utf-8?B?aVpYLy9iUkF0dmxlVzR1K3hSSFBjK3U2SlZJQzhxZ09tUmhRSU1kYWdPZVd0?=
 =?utf-8?B?R1pxZVJKT0ZVZUhUQmx0elNHVE9hdFZwK3AxaXE0cFFhVFdrOGFVZkZUd2hn?=
 =?utf-8?B?d3VxMUNWb0JZVXBJWm9ub0hoeVh6WHpBTWtSQmxreGFuWllrSEJGaEtlSUZq?=
 =?utf-8?B?RlMvdXBtM05xZXRiaWtrVk95UUxxQ2NhTkwwY2FReUpCNm9uNlRGN0NzempQ?=
 =?utf-8?B?QUlmcytRY2dkTk4wQnJKSzRGQ1d4SHFNbjFFZUpQYXJjQk95Mk9xaWFDSjlk?=
 =?utf-8?B?cFN3Q2c1U3g1NGtTeDMwUXBNekc1VSs4ZXVDR1FvQUIwK0xqU1RkdEViVVJX?=
 =?utf-8?B?ZmhhQ1hRYVdET29tZEtTMzh6ME1hYXVzUHpxdzE4R3JFN0o5dmRrWDlKOEZ0?=
 =?utf-8?B?V2g3VEk1aVd0Z0k3Q3RnM2VMSmJyekk1dmRwQzJGS2FZMDBBTnZFTHJDV1M3?=
 =?utf-8?B?TXFFdHZreHIyRVZST3FYWnBlODFxVHR6dTlPWHdIZ0lveFBzSERDT3VjUUta?=
 =?utf-8?B?OGxwZnhoRmg0MDVZTzE2NnVYZFRZcUxEK2loWlJOYkRrTHd0YzhDSlFWL0tz?=
 =?utf-8?B?VlpaMjJEakN6bWsxN1I2eml6ZXNnT0hUMTliOW9Vbk5POHY0Yi9SczRjbFIy?=
 =?utf-8?B?cnpLQUxkWGQ0RDJtTUVwM1FyQUNqb09iMFN5TWVBa0w0ZSthUHhoQisyNC9E?=
 =?utf-8?B?NEFmNE94TFVFNmtkakRRSWJKdkRUdWY2bUJ6VjlmRjRWQmwzSWJkKzJjeitZ?=
 =?utf-8?B?T1dGODY1S2dCbjV5VUFPTDRkOWlHMVgzVy9oQTdLKzIzRDJCbWxzMGo3VnZ4?=
 =?utf-8?B?Y3pSTjNCOSs3NldJYUdqRTNNTGl5YmpqUWI1UzUzWUZ0anJFYlJoL0VsemYr?=
 =?utf-8?B?YnlDa3FOOWFhbS93Y3p5cFVKQmRqQ053REhFdC9GbVp3VjdEcVR1WHVmVFhq?=
 =?utf-8?B?WU4yUFZ4bmo0anFFUXl0TUpMc3BIbDJqM2JQaFN2RVIwUjh0WFkzSGxCTmU3?=
 =?utf-8?B?d1hNV09qUDJ0cHh1UGdZZWxFZjVFanlGTTlMNDBpYkNxYVpjMWducXlBZC80?=
 =?utf-8?B?NmJCVUJyaHpWTzJ4UGZiVUpvSzQ3M1NkbUJQMlFOZUZCZjUwdnFkZDhKME0w?=
 =?utf-8?B?TUt3OVZZakpYU3F4NklFWnl3UTRYdG1uaFcxWFIvd2NyUkJVRVBNclVnRTRD?=
 =?utf-8?B?WlV3RVZjc0szcU1abDB5S1lVeDBEalZSK3p0ODAvMnZyZnpTSTBxWmp4QVEr?=
 =?utf-8?B?Uk1hZ0Y0RktZK2FkVzIreUR5ZWQrT2lpcG0ydE53b0FyUEIvVE9aMUdnRGhp?=
 =?utf-8?B?S1Mxd2hSZjZJY0NxVkE5ZXMwMkhubDZwckpXMVR2Z3RVNkk4dlM0Z09rb2RP?=
 =?utf-8?B?YTc0VjJjSlFIOWgvRFkzUCttM0dRSXV6cy9pQUJQOU5rbEZ4QkNDUHFLSWti?=
 =?utf-8?B?R3lpTzQ3ZEZmcHZ1OW5aZ1lVUEk5aDViY3BURWYxT2RLMWdYeEpUMkVGc3VR?=
 =?utf-8?B?b2hObTVZYXBuTWdVWGNjSTliRDFpSkhXNVVmTXA0MHVDTG4yNG9scFYzb0Fr?=
 =?utf-8?Q?1ORfqMc760stl0Bzjal+kNstHZWsTbCj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtpdFBMcEZDMERNU2RXOUx3a0thWjl0R1NtZWkxbkNyNUhibVF5czQ3MHNF?=
 =?utf-8?B?TVRSUERsMVZWSXV1RFRvUkxMTytBdEdZZnRva1hHRE4zaGxqUGhHOU94d0ll?=
 =?utf-8?B?azY1M0Y0WGkzNTNxWXVuTko2bEZIWnhvS0tyMG5nYUI2Y3pDWEJxdVRKODlU?=
 =?utf-8?B?T042WjJNRFBzMUM2NkZENTNuRHR3QVRMODl1bkFjYzM2NklSci96S2RQb2c4?=
 =?utf-8?B?eFlDT3JDNHhSM1JubEdGNk9yMFBzTFRoUVVXeFBHV0NJMGJlekFXOFNnbEJU?=
 =?utf-8?B?U3JONHdIQXhwbWxRY0RpcDY5SlAzWm01T25ieUNRSWVKTXE4SlRFUGo2WHBK?=
 =?utf-8?B?bTJjNXcyTUFlLzRwZys3cTMxWG94YlcvaXZneDA3SVA0SDQxZlZMREhaV1ZV?=
 =?utf-8?B?czNBZ2VwV1pxMnFQdHU4MlM2ODRSMGphTGtaQ05rMDdiaC9oK0FMNVE3dS9m?=
 =?utf-8?B?eVZOTkJoVlRJZUhKMTRsMEcxei8rQWdPcXdjU1ZHS1hhR1ZQOHd2SzNlRFZw?=
 =?utf-8?B?N2hsNXRWUW5OU0JYSmtFWW1QMmxtNkRCcng1NFdVaUJPUW1ydFMza0NVZDhI?=
 =?utf-8?B?KzZOYk1KVHBJVTFROUExT3M4WHBjQ09uSTEvQ3dsRHVaNEM4QUxQbU9CWnpr?=
 =?utf-8?B?OFNEcHRxZDE4ZStzSExPQzVZaHlvajhPcFBtcmNFdjBidHpUcEs2anZnVGtH?=
 =?utf-8?B?WktYT1FOVmJqU2VIaHFHODRJS2F4Qk01Zk1ubFl1NVloY3RsemVYN2g2WmpX?=
 =?utf-8?B?K3A5OW1raE9tRERTRUlPUmFDYnpGNzFmQmVpaXJzS0FkMExVSTNSSHB2b3ht?=
 =?utf-8?B?cXc1Qk9icmdPRCsxNHdFeEhBaVo2MFlxWkdQNGdTcmdyWEQvTVJ3a25IZ2NR?=
 =?utf-8?B?Q2lPRENaVTFVUDhZN0sxSVplOE9Fd1ZxbSsvUCtOaG9yZENOZVZweGxMM2pC?=
 =?utf-8?B?b1NtNHh5Mk95QzBpQkZTZHRJZ1NuVm5OVTNZNCt2NmtHc3M0ZzRVTDNUQkx6?=
 =?utf-8?B?bXZCYjQ4aWR0dDhrck1IUHA5RThWVG1HUW1sRFRRS2V2VFd5WFVKVkw0WUQ5?=
 =?utf-8?B?UFI2b1pveVVFUWxCMkUxK1hLa0RlcEU3ekdpaFhXb2tvUndsd3RkQWpqbEln?=
 =?utf-8?B?L0dETlR6MDhqcjlHdkxzMnkvcFZhVEJPVnBKUVgyT1hYWjlHSjFWRi9kanlx?=
 =?utf-8?B?NEhzT3RhbDR0dm10NGNoeER6Ym1wZ0p0ajNsTGc2TzdXU3BCbk82RWhZaWdZ?=
 =?utf-8?B?ZnQxVkM5WmdheEhGdDRQZXVZV0VPOFNWNTN6TXllYmF5QTc3NmNBNnpDdjBp?=
 =?utf-8?B?VVB6OW5zU2NTSEN4SmdRazVERURwVndLK0JEbWJHTFJLT053NG9UN2pqWmJh?=
 =?utf-8?B?S2h1WVRRV2VPNk8rUWFCYmRqcXNhdlNOMWFmMld0L0N5QUx4V0RMSnFNT3NQ?=
 =?utf-8?B?L0tTZlp1SU1OaVRZdEdTRjluS0pKNzlQRkw3N0htcTNnTVdqMFBDWkI1Unlx?=
 =?utf-8?B?M1pMK212VUdhc3hQd08vZFBLbkNHVmY2NVZ6clJHOFFHQldoSldIMWJyRisv?=
 =?utf-8?B?aUJSNGNUUUVIb29DalZmNWpzZi9HSFFiVFNRdXNBWXcyazVxT1VqazhOQVpv?=
 =?utf-8?B?T3VTZmh6YjAvbnUzblNLNzNsSENqeFR1b2NyTFpHWk5TMzRKbTVaQk1MTGJL?=
 =?utf-8?B?a3VNTzhDVzdtbGVacmxzdVlVZDV1N1JjMnlDMVNNYXJYOTQ4clQzU2Z1Mnlv?=
 =?utf-8?B?djQ0OFltOTdzQ0haaXRyRVZlK2UrQ2FZZDBDckFZS1BZZHNUSWl6Rm5sR29Q?=
 =?utf-8?B?VlIzUlRSU1FTT2YyTUU5SXJhK1hPRk5VbVRmbmNSd1p6YkhyVjYzZ05YOXZv?=
 =?utf-8?B?QllmcFNJbUFTTU1TUi9oZ2o0Y2R0Z3dKeHBTRTY2SU9xY3V4T1VvcUNGSVh6?=
 =?utf-8?B?ejdBbHlYcitQRVJseWNEaDhwb3AxbHdMeU9DcU41aHZNcExGZ3BFOEpsTFFu?=
 =?utf-8?B?ZkxKNk0wc2NRa0lmcG13ZmNwVFNCK0c0Uzg1aUM1SjV3WUlRNXNwMTQ5c1FM?=
 =?utf-8?B?R2FJbEV0SjVvN3BBbHpGcXFpL2RTem1mY1pyelZHcCszd0hOV2Z1MEtLMWRl?=
 =?utf-8?B?VVYyYkxzR0lYbTRIa1NIeVNGbkc2UDJ3cWQwVElxdXV3YU1Ic3BNczlGL1NO?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7db19f-9860-4e93-9362-08de02836a99
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 13:47:38.7165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWcnkJWCh0TdC8H/vqkRqZl/8TRaPJxpmGIF8BfyVnHj6KNudi463J0pn+RHF9Yl2gb1CfQUzQRE4DkUVGK8uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6294
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

Quoting Matt Roper (2025-09-30 19:56:38-03:00)
>xe_info_init() is getting a bit long and hard to follow.  Break the
>allocation and basic initialization of the xe_gt structures out to their
>own functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 88 +++++++++++++++++++++++--------------
> 1 file changed, 54 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 86e6dd751b1c..65312fe9b97b 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -683,6 +683,53 @@ static void xe_info_probe_tile_count(struct xe_device=
 *xe)
>         }
> }
>=20
>+static struct xe_gt *init_primary_gt(struct xe_tile *tile,

I ususally read "init_something()" as a function that initializes an
object that already has its storage defined. Since here we are
allocating and initializing, I would prefer that we call this
alloc_primary_gt().  Just a personal preference, feel free to ignore.
:-)

>+                                     const struct xe_graphics_desc *graph=
ics_desc,
>+                                     const struct xe_media_desc *media_de=
sc)
>+{
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *gt;
>+
>+        gt =3D xe_gt_alloc(tile);
>+        if (IS_ERR(gt))
>+                return gt;
>+
>+        gt->info.type =3D XE_GT_TYPE_MAIN;
>+        gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
>+        gt->info.has_indirect_ring_state =3D graphics_desc->has_indirect_=
ring_state;
>+        gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
>+
>+        /*
>+         * Before media version 13, the media IP was part of the primary =
GT
>+         * so we need to add the media engines to the primary GT's engine=
 list.
>+         */
>+        if (MEDIA_VER(xe) < 13 && media_desc)
>+                gt->info.engine_mask |=3D media_desc->hw_engine_mask;
>+
>+        return gt;
>+}
>+
>+static struct xe_gt *init_media_gt(struct xe_tile *tile,
>+                                   const struct xe_media_desc *media_desc=
)
>+{
>+        struct xe_device *xe =3D tile_to_xe(tile);
>+        struct xe_gt *gt;
>+
>+        gt =3D xe_gt_alloc(tile);
>+        if (IS_ERR(gt))
>+                return gt;
>+
>+        if (MEDIA_VER(xe) < 13 || !media_desc)
>+                return NULL;

I think we need to return NULL before we do xe_gt_alloc().

--
Gustavo Sousa

>+
>+        gt->info.type =3D XE_GT_TYPE_MEDIA;
>+        gt->info.id =3D tile->id * xe->info.max_gt_per_tile + 1;
>+        gt->info.has_indirect_ring_state =3D media_desc->has_indirect_rin=
g_state;
>+        gt->info.engine_mask =3D media_desc->hw_engine_mask;
>+
>+        return gt;
>+}
>+
> /*
>  * Initialize device info content that does require knowledge about
>  * graphics / media IP version.
>@@ -765,48 +812,21 @@ static int xe_info_init(struct xe_device *xe,
>                         return err;
>         }
>=20
>-        /*
>-         * All platforms have at least one primary GT.  Any platform with=
 media
>-         * version 13 or higher has an additional dedicated media GT.  An=
d
>-         * depending on the graphics IP there may be additional "remote t=
iles."
>-         * All of these together determine the overall GT count.
>-         */
>+        /* Allocate any GT and VRAM structures necessary for the platform=
. */
>         for_each_tile(tile, xe, id) {
>                 int err;
>=20
>-                tile->primary_gt =3D xe_gt_alloc(tile);
>+                err =3D xe_tile_alloc_vram(tile);
>+                if (err)
>+                        return err;
>+
>+                tile->primary_gt =3D init_primary_gt(tile, graphics_desc,=
 media_desc);
>                 if (IS_ERR(tile->primary_gt))
>                         return PTR_ERR(tile->primary_gt);
>=20
>-                gt =3D tile->primary_gt;
>-                gt->info.type =3D XE_GT_TYPE_MAIN;
>-                gt->info.id =3D tile->id * xe->info.max_gt_per_tile;
>-                gt->info.has_indirect_ring_state =3D graphics_desc->has_i=
ndirect_ring_state;
>-                gt->info.engine_mask =3D graphics_desc->hw_engine_mask;
>-
>-                err =3D xe_tile_alloc_vram(tile);
>-                if (err)
>-                        return err;
>-
>-                if (MEDIA_VER(xe) < 13 && media_desc)
>-                        gt->info.engine_mask |=3D media_desc->hw_engine_m=
ask;
>-
>-                if (MEDIA_VER(xe) < 13 || !media_desc)
>-                        continue;
>-
>-                /*
>-                 * Allocate and setup media GT for platforms with standal=
one
>-                 * media.
>-                 */
>-                tile->media_gt =3D xe_gt_alloc(tile);
>+                tile->media_gt =3D init_media_gt(tile, media_desc);
>                 if (IS_ERR(tile->media_gt))
>                         return PTR_ERR(tile->media_gt);
>-
>-                gt =3D tile->media_gt;
>-                gt->info.type =3D XE_GT_TYPE_MEDIA;
>-                gt->info.id =3D tile->id * xe->info.max_gt_per_tile + 1;
>-                gt->info.has_indirect_ring_state =3D media_desc->has_indi=
rect_ring_state;
>-                gt->info.engine_mask =3D media_desc->hw_engine_mask;
>         }
>=20
>         /*
>--=20
>2.51.0
>
