Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA89CCF2C5
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 09:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68810E3CC;
	Mon, 19 Jan 2026 09:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8b25Tlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C9410E3CC
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768813389; x=1800349389;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZRvft1W9TkgqLwHhdpmXycZ1gr7DQ56lMf4117+A9hU=;
 b=D8b25TluqdhLLcsumEEu9l09zbylyNAFZMCBKO7+5+yeclU7pi5IvIuz
 KhqIvpgWAe4rH+N5ZOCSdm1D4BapddSICc2x5sVujrTbRov4BRmUC89YD
 UfrmMyXT2+/GGyFAfFo6O0c/Nv5ttLchr9Sm/hs4zaD+1NcSqDl7SWt6r
 dC+nLYWmFykFpryb0klG71e/1sN0NxA4TckTAlrYo9rBl8hnfYyLfcdh3
 Fg2++LXJDe1aqKTluPNAMVCVheOSrSKeGwAN8LV6IzMWfDsatLaoCtD4z
 +i66749BW3kYXg7OnorLzbCxXD3aaYJQNL1I9uiD74D8qS1fKN5v3+j9G w==;
X-CSE-ConnectionGUID: MlgWn7P0ScWP/Srwd3IbCw==
X-CSE-MsgGUID: VTKZpPOpQp6r3JenTyJ79w==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80656625"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="80656625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:03:09 -0800
X-CSE-ConnectionGUID: VDKdj1czQQqeeBlU+OK3/Q==
X-CSE-MsgGUID: 9y2R5M69Qo2KPEy+ZUzvKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="204964758"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 01:03:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 01:03:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 01:03:05 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 01:03:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMb27fJs+r3b+6HyX9Vib6gFpPKtbAHaDnKuaornHouxZoH7A7WLZP5XA48TkcnXUKTwRgFAjQYSMRKZB5AzgfnMK12hFoxu5jmYtWbGa1Oxd8Emz/pTjKi8OL7ON7pTmbz0iP2odsV6vjOdrYDrAOFjo/aFWA2lU7MLa0lqYPx+xyG27oJaSCUuuVRPFZgE/Q7D0IIWsBCp/Y7r2qh8EioUbJaPjTZSpJqY8pk62vwoMiLj0P+I29h5UFcDuS8vnu9Zj7bV35ysLwRRGtxX4WZShLjF7+sGAoVG673ZrWHe6tiyglrBhgZ+Rnv8x7+snX0+o1r4s9HLNntpYkoIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SYE18CA6n9oZDm3s28hVwH65psN7NSICoW3Dt1iY0M=;
 b=v1eputzBCng/YZvvHrjmPTqdViDv7jotm9ECSMFUFIcIdlKh+CSV+YRe9nFSeWXMwBSdrj8kO7OneZ3brhRy16WcJE5QLNvPYRp57sz0KBczDNKCiJ6Ulkaa39dqtEDnZK5IPI2Fzmf53pN8s1E4ILRZ31V+2rjf1iJgMCvwq7NepiFrnXRapzCaeVwHSiUR6rFgTsufGevGnZvNazhrR5z4IdBsktSRt332LyMKtvaFRzwdfGf7Y24Gw7Kpe5GULjzZIprsoV53dZEw4wQy9rEkH9sKCdAXhZIFhSwPj4v8WQKvD0Ou7AJ0+zJBMxphQTJMNStjI7hUyNfkxIYzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH7PR11MB6955.namprd11.prod.outlook.com (2603:10b6:510:206::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:02:57 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%6]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 09:02:57 +0000
Message-ID: <64f5dd9b-c6c1-4467-af53-a6104564dafd@intel.com>
Date: Mon, 19 Jan 2026 11:02:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: s/xe_vm_bind_kernel_bo/xe_kernel_vm_bind_bo
To: Farah Kassabri <farah.kassabri@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260118102431.5085-1-farah.kassabri@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260118102431.5085-1-farah.kassabri@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH7PR11MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: d3566de7-b6db-4cdf-e994-08de573989d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUFua0RNbSsrWFcxc1RwdWQvc2NBQTJ4NWlabmtEMzMxdG1tWGdOOFFrTERU?=
 =?utf-8?B?bDc0bUVoeVZKMTNPS01NRGs0S21KamgrVW5YTTFSYzZVMWdVVS9rZW1NZi9h?=
 =?utf-8?B?Z3pPb0tpVkwxRzdaYmxEN0lkditCM0MxQ2FvMlRIQ2I5azdMcVdrM00wMGpN?=
 =?utf-8?B?Q0dYd3pSR0owVEN6dFNnRENRV0R1MlNqUTF3ai96QXlpY1U5ZmtQVmYrWkNP?=
 =?utf-8?B?M3NHWW44WUJJZW1RakxRNW5HYzJ4VkhRelA1V0h1OXMweWplWUFOWnFaR2Ni?=
 =?utf-8?B?WndFaGlRTGVRMFBFeFdKTm4wWHdQVllkd2tUWmZxS2QrUW5kN1c2MnU3QWxi?=
 =?utf-8?B?WDN3Ylh1Ny9CRGYzN2hDelYxNUU3V082TjdRakc2LzBXK1dDVk1iVWNDQmk1?=
 =?utf-8?B?SW04NlUxekJLdHp4Tmw3Zy9QS1VTRWZXMTlNYXBuYlRrTXNHSGVyMU5JbUlv?=
 =?utf-8?B?bFlJYitjWFc4eHJJUUtXd1FDZXdQUldCWXl5N0FLVHM0RFNjSnk5TjdReFdt?=
 =?utf-8?B?bGVpdHlqTEVQUjZJVHhFZU9rUksyZGMzbUVocis1ZXJWQTJtb244N0VsdU8y?=
 =?utf-8?B?aVREd0hySHJ4dlRVd1ZZQWF3SVlFWnIxeFgxSUYycE1WazdoMXRldC83MnBj?=
 =?utf-8?B?T1lvZ1BRbkFHbkJIK1h6eHBmUEhYN2ROdThSaWdHUGNBY3lxQkFjSURnbkVO?=
 =?utf-8?B?NDQrcUFKc3BlVkt4RU1Hak1UUitTN01YTUZ1bjRWdTBvTjlZZ0Y4TWxPL1dv?=
 =?utf-8?B?MWFKdmZNbGJ0SXdKQllMaDd4dEN2ZFkwemV0cFE4QWlVemtHYjE0M3pCaUNh?=
 =?utf-8?B?Z1lZT1U4WEthNUxnTkV5SU1jNlptUDhiVmswQ2dkbnVKcU1Fd0VycGxXRHBr?=
 =?utf-8?B?d0UxNHJwQTZhdDZUM0E3bDczYkwyeWx0SG9vMlhSY3J6N3lEN0FMSDVabEpa?=
 =?utf-8?B?U0NTeTM5NEJhNE5FSVhxaEI1QUVzdDBSSlhiRkxqb3UyV0VFa2VGUDQrTU1j?=
 =?utf-8?B?K1dGMlYzc2RqUGdLZnVjazN5Wkt5ckhGSzh2bWJZVSs1RmhkazJNREtyOVpG?=
 =?utf-8?B?QVhGZFE2RXVoTThrWnArdStCaUJFWnlRaHdhZ0hkZlFzYzVONU5aWFJFNkl2?=
 =?utf-8?B?Y1p5azJQMmNKTUFXRjBxSytYdTlqTjRVQVBwclA0c0VTOU1TL1puRHlUQVMr?=
 =?utf-8?B?eTRSNkFVTFNxcXIrZHdlT1l1RTZ5VWhjYWRLREpuUU1jSHJRU0xJN3BqejZG?=
 =?utf-8?B?Y2o3VE9aZnBiN1NXRENxUEdOVDZYZTY1T0ZpZGFsMnJjNkJxakN4UDl1YzNH?=
 =?utf-8?B?clhWT1pRa2NMYW5FVWJzMXd6VEhURnFVRXlldmNjZjhEcWJqeGlDQmxhMnN3?=
 =?utf-8?B?SHovK1htR2V1NWliNDlob0pja2dXMm1HSHRRNk9xeHo4MVZhMDFNM1AvVjM5?=
 =?utf-8?B?YzJDSDRRU1Y0N2p4ZEhFYmJBVkxtNnl0b3owMmZROGdvR3FaNUlXSDY4eDFk?=
 =?utf-8?B?TXowbTc2SEp5MHNLMkhwWm02VWI3VDRnaUpaZXVSbHJtWDFpbDRhTEI2cnly?=
 =?utf-8?B?OWZoOFFWam1TK3lDLzh6QTNXUDRoUW9ZcjRqV2h2OGsvNzBPd2kxbjArQVRY?=
 =?utf-8?B?WmNVRkd4cDloMTE1dFR4WEV4aWpGR2hyYWRIZlluSTZ3cWdxYmlIOFZiTDg4?=
 =?utf-8?B?ZmIxNFU1NjFFTGhQMGppaS8xUmhzamN5eWFlcU4waVlTK3lWeVM1cjZTVjhs?=
 =?utf-8?B?NnVKUjZ4MFR1UGxOV2Z4eFhkSFJMQzB4cUdUWnYzV1NLQnhWVXJoY0NqRzNS?=
 =?utf-8?B?ZmZ3LzVRL2QyWHpsdDM1UWNpd1VGNFQyY0VrNHhxYktXblVVS2pnR2xZc0o3?=
 =?utf-8?B?YkJoNkVpa3RaLzU5OUFURGdDTC9xbkNaOXpMc3FQRWd3UW5nK0lqS04rUVQ5?=
 =?utf-8?B?OFhUV2xDWVdzRStMbWZkaTlKQVJ2b0FjVjlqdjJMc1JyYXo4S0lwQUtqL0Zq?=
 =?utf-8?B?THNJVjNTcm5IQlFvVnlUajRiVmE3MWNUQnVWd0tnREJSMWZKT2lOMzFjKzVV?=
 =?utf-8?B?TlY3dmw0OUl3R09maU11Z3NmSVMwQ2FiYTJSZUhKWUEzK2wvam1TSHVMMVJx?=
 =?utf-8?Q?IVDI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEs2SHVEOGVlcmlpaUFZZGs4dFNuaktQOXppSlJjcDNvRzl6bDZyZlRseHUy?=
 =?utf-8?B?UVhjQ0s2VFhJcHNrU3VJdnBkZnFPcUhXNFZLRWhPWEJZZk9PVno1N3YyMTY4?=
 =?utf-8?B?R1J1MGpibXlvQU1CMWRoSVFOcUFsOTNOcVUyQXpqYllqVmpLU2pMT0grM3dx?=
 =?utf-8?B?NFIvdU5SYWlDWldVRGRYSUZsQU9PS1FEWFRNRTh3VXM2MFRzb0JSdHVZQnRM?=
 =?utf-8?B?Rkp0YXdkYTNDYlhDTVoxbEU2US9rWHBId2pRTTc3VHEzVGMybDBUMlZKeEk5?=
 =?utf-8?B?WitiOEh3NTA4bGJzd1k4ZVAyZ3Bja2F1RHBwMmRhRDAycFhWNjVDUGlwclZS?=
 =?utf-8?B?R0FScUtDZWZ0WnZZdnQ1bzdkbGV3L1Y1Yi8yd25kSTc5czloZWhidkpSbXk3?=
 =?utf-8?B?RWZxR0hobjJrUjVnSHMyN0x5TkRYa2NKK2VJRnRCa08rQjdwK1I5bWt5VzUz?=
 =?utf-8?B?TDJCYmhxa2FhRERucmdUVDFmY3Z1TDBub3k3OUFGaDZkTzEvL3NrZGMvaWJl?=
 =?utf-8?B?WTFTNlhYaDdxVm9aNHFOd2JkTFJhNjBjTVFXTDlPKzBWM1Z0eEF5WEtpYXFC?=
 =?utf-8?B?U2JnY0NFbWQxVE5uSjkzS0plUG11Wm8xVkgrbzZxKysyMnRTYUdrMlJQcm13?=
 =?utf-8?B?MXdxOGNLSC9tR3B3MzhFeXZNS2pMT29kQjR6Z2xPS1FjbFRHVjZUYW9SRHB2?=
 =?utf-8?B?VnBOb2ZPWTlJWDZDWkp3KzU5RVpFUzhmNS85WkpyL3I3dkJsT3BEaHFhVnlM?=
 =?utf-8?B?WXZSQ1drTjdhT0QrRWxRU0lpNDFQWUxFWXIxRWl3Y3hPYzdYQ0prUlRRWDVv?=
 =?utf-8?B?MnNTZmxXTkZWc2hzZmJlNzdlenQ4dHFrSVdQWE04Y2phOHZld281Q2JGN0tX?=
 =?utf-8?B?QVFiclZBbXdKNDllZEhEbzRIWUxpOHhsRHBweU4wVk03M1MzL0U2ZjZjemti?=
 =?utf-8?B?UXY3YU44dHd6bnZ4VXUvMndTdXpIZ05ySHRvYmZLS1g5dDN0VWZlTE02NmJ3?=
 =?utf-8?B?bWh5Njd5MXNnQzRiNzUrUzhEemdZUk44TlNvb0hFVmQyVHgrVXR5RzRqd1VR?=
 =?utf-8?B?RkkvL3FZUUtqSW5UemtRZC9iejFNNENCUTJDTDNMcVNhZ2FnL0tPMXgvK1hl?=
 =?utf-8?B?UE5jTmdxN0dzTDA2Y3FEamoxL0RUckFkSzkrUFNCYXlFMUdUeXdQaTFvSmwr?=
 =?utf-8?B?a0taK0orQ2R0QklwaDdIcFNib25kYXpJK2hPNUk4WHQ3TnFRaldTazJySjhD?=
 =?utf-8?B?VmhmWGtqTlN6U3U0V09NWjFqdWdVdkcyZnllK0NiWnEzaDUyQWdYRk9QalFx?=
 =?utf-8?B?SVlXb2RGLzlPRU1jaTFncFZkbzRhdVM2N3hydHVCdUxGcEgwbjVSSlBkSEhL?=
 =?utf-8?B?VnVTTXZ4eXNSTnJxZUN6Lzlpbm9oek1pRldIbHFLSWVCRW9GL0Q4UksrWktw?=
 =?utf-8?B?NHJ0ZXpZcUN5MzZjUC9scVFmTVY4YURLNkdKL3B5dVdjMW1xdmcrV2tHcWpK?=
 =?utf-8?B?WWUvMStsVEx0cVNoUU5UMFllbk1LNnBzQmREdUo3b2hwNjBtSjk3dTA2c1Mw?=
 =?utf-8?B?VmJJMEl6djhpVHNWSkRJWGY4M3hieUZYbVBiQ1Z1Um1udnZPZzlmblM0TWhk?=
 =?utf-8?B?N2F5d1JzK1c5THh6TG9RTGgvM3NxVWNKYlQyWWhkd3JWNzJPUDUzQWphT2lj?=
 =?utf-8?B?bFhGeG5CejZrTlZYd1d1dlhUQWV3SHB5OCtkTDZCREh4cWJrUTFXYnh0cERm?=
 =?utf-8?B?a0lTa3FqaGpVUWJpQzZYdXYxd3dWMG5wSEJaTFYzRzNjazlRL1BKMXA0TElD?=
 =?utf-8?B?QVBXOWp1U3JTYmJRWGhPR2p6amtDcWhwc2cwbE5QSVVWT3J3bEZQZzZuUVF4?=
 =?utf-8?B?WkdaTW5Rby9NR0VKV3FDNHYwQ3U4cGJ0UGhFQWR0ck5PbDVtTE1laUZsOGV1?=
 =?utf-8?B?YVJINU81R0NyMGFrMmNwUm1pMFBmT1JjeVhqV0t2UDlKeVlrRkdyVTR0dk9o?=
 =?utf-8?B?a1p2OVlaYWtNd1pERlY3eU5mRlFXTmdEajZJbFoyUGZET1p6OEcrdUEvYkg5?=
 =?utf-8?B?alJWaHhTRk9ON0s0eWxueGJEMWdEdXQ1ZWUxeFRlNk5NTzE0UXpoV0xDemdZ?=
 =?utf-8?B?czlWcHlhOXh0YzZ4VXRTVnBoazlUcEVHSzdCb1JxRFlwSzFWeVkzWVhRd3po?=
 =?utf-8?B?ZVEzTzZXR3V0V3JQa1ZsRE1seUV5cXg0OWJuMGdJVjFPWnpzWThzTDZnUk9l?=
 =?utf-8?B?dXhUY3VjM2JKYU9KVXJ3UGNCdjloZjVlcGxGb1BUalQ2dkh6ZW9xSHFObnRa?=
 =?utf-8?B?dDA1ZGVGeEVneE02TEQvcVdvNkJPdDdSWHVqaytzMlAvVjM4NDNidz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3566de7-b6db-4cdf-e994-08de573989d0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:02:57.2600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9ow4YWcBNr3c+nI6zC6x7SK9ULBeGPhYiqXG17H4VaN2ZtPcjLJ+ldcWbw0WgNhMwopvj36LtFhxqlVc/lWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6955
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

On 1/18/2026 12:24 PM, Farah Kassabri wrote:
> The existing function `xe_vm_bind_kernel_bo` was originally used to bind
> a buffer object to the kernel VM, but the name implies it only works for
> kernel BOs. To clarify its purpose, the function is renamed to
> `xe_kernel_vm_bind_bo`.
>
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>

Reviewed-by: Ilia Levi <ilia.levi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 7 +++----
>  drivers/gpu/drm/xe/xe_vm.h         | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index e60526e30030..e23ee12d8e1d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -130,7 +130,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>  	if (err)
>  		goto vm_out;
>  
> -	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
> +	fence = xe_vm_kernel_bind_bo(vm, bo, NULL, 0, XE_CACHE_WB);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto bo_out;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 694f592a0f01..a27145a4137e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3830,20 +3830,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  }
>  
>  /**
> - * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
> + * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM
>   * @vm: VM to bind the BO to
>   * @bo: BO to bind
>   * @q: exec queue to use for the bind (optional)
>   * @addr: address at which to bind the BO
>   * @cache_lvl: PAT cache level to use
>   *
> - * Execute a VM bind map operation on a kernel-owned BO to bind it into a
> - * kernel-owned VM.
> + * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
>   *
>   * Returns a dma_fence to track the binding completion if the job to do so was
>   * successfully submitted, an error pointer otherwise.
>   */
> -struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6cc98df47291..ff32f43aa1d8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -268,7 +268,7 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			  unsigned int num_fences);
>  
> -struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl);
>  


