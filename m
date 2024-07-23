Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E20C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 15:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D96210E5EA;
	Tue, 23 Jul 2024 15:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEh++ZSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A05610E5EA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721749474; x=1753285474;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oKsf74RJKYW35or3ALpk6hNlNkK/CpiXa0+hcl5gl/A=;
 b=PEh++ZSpsjgNQlrinTpq3oyqqPOtLB8JMCJsmsPKUBi7w1hUITGAtKB+
 fT+kuQKy879b5FdUPwlX2Jvolwa3c4UmCJTrn/lASGZLynglI8j01WMrE
 R4L0hylSz7SXMdquujjzPOANIXsTDZa2s3m7wU8qnaWZANql4Jg2oDPeD
 nlbMFvQNPUp5FmzTBWSnm+xUN/jrWLLzXvgellFHYqQBZCabnKFEmqTZ4
 3DpIVyY6NAbm0UUxLKsJd0qESRbAIsB/LOCOU0CXs+HIfZw1NoWNSb2mX
 l3f55kDgubnJmC2P/+m9z5aA2gzYudJVh6G7q2DEc5RIRnv7rxOJT9HTW g==;
X-CSE-ConnectionGUID: jk8vjPMtR5qTPfUb8I33iw==
X-CSE-MsgGUID: Fr6fUF70R+ivFxzLpo4Dwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19346149"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19346149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:44:34 -0700
X-CSE-ConnectionGUID: x/NQVqt7TI2tanRN9DukbA==
X-CSE-MsgGUID: 92rOZd5SRN6+Dre8yzhMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="89740374"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 08:44:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:44:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:44:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 08:44:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 08:44:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLEdYEblkvMcmyQls7aFPa0DHwMI1FVMZlJgRY1/xxhKRO+tlQxgKHK7/xh85Da6QBjeq6BYBgtrlTHoSv8yMy8zFLGgCe5h/LBN2snj0dT1VOIU2l2x2ZTxS9UdpuRWBXrsxgou8rpfeJTUxveLji5SibRGB/CYVZuEsrgP+rRV78yDe0kSSe/0RTQ9/43laVZQOKZjhSHeAk9rC4stxdCyafroymCPqDY0yooMryVgyk7c/dcs80RwS27aLx8G3AiS7+iuud7d9FRLsaCxRau37twQBbX2Crrc7YimlqfivqY5Tf3GdxjC5b+m/+e6UGB0cOyXzZyDFVpZhu0XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jUo8ffkWFEVpCEJUuinhJJzO/g7Ngkw8uMkwDq++f4=;
 b=yHrK4/QShNdpPvOd9EVGNZMqxbYjW+anKPLZRhFufDl0DMOCbpE0idjR8LxAoXkuR1aKfewCMlorRAlZBuYBekFdIrQEDBGfRP03MuiPiODU4HYxx1XSAZ8RP2swV/+Pbnqv9WfVwgzWodPw6+7veO1Ik6UJaM3Uek/MoRlPVhRYHLpv1iFydc1/oWEKsUzRvO1OZIQgOxS9QmJxhw840Vfz66U6W+MX+EMMxZaHCid8KhWtXdLEg/GrWPuy4LT5w/UWQ2L5en98/wfv0Jqe2oe5lvfeqHCGwZFheTUFyxZKAmdlOspw6qAtVebTgPgBsNHCYUZhbhJB4QaFFggpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 15:44:30 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 15:44:30 +0000
Message-ID: <cd8d4284-0905-4481-9276-65f430f10d62@intel.com>
Date: Tue, 23 Jul 2024 21:14:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/mmio: Use single logic for waiting functions
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240723120120.5443-2-gustavo.sousa@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240723120120.5443-2-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b9fc40-70a5-4b15-f197-08dcab2e577a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTBUdmxiNXJldXZIYlRkWnRwSnlrN1cwcFY4ZzRFYU5WNWdYbjRkYTBIT0p0?=
 =?utf-8?B?UXh2WmtLcnMzS0pkMUs4ZFQrZ1NOalc2S051Q2xRZmJhSUJtKzhJSndqUnVQ?=
 =?utf-8?B?MXBLcFFJY0JKd1hWaHpSUzVjcjNJeVNFVVJRTnpMeWlJSkNXeXhTNUhVSDcv?=
 =?utf-8?B?MDdFZFNBWFhzQXpoL1UrNmFSRCsvbkVUTFJTQk1UbnNMRFI1UERZWHZ0WC9k?=
 =?utf-8?B?VkNBRW5nMmZwUnVvNElYb1NRS1ZoOVBMbmtDU21TS3NteElBQWdNQkRqNVFI?=
 =?utf-8?B?WFk1RDdjSno5bHVGTHFRQ3hYTmxRam5KWE1MWjczNDlzMU15SEN6bURtWkZV?=
 =?utf-8?B?RitBbEJtTGNaNFFMZnFGQTNYbzBOUzdmTmNZbXFtUzRPR0hMTFZSQy9tSkxY?=
 =?utf-8?B?QjllTWRwb25HSmVBTXY2bUwyR2Qwd05ndW52Rk80R0lWVTl6WEM5ME1nNktL?=
 =?utf-8?B?Ry82MStaNXdaQmQwSGljSUhJQkIrZ3ZiMHYwdy90N0MvZUNweWMzSHdhdTV6?=
 =?utf-8?B?Q3pOTXE5cWRzODBIdkhKY2F0VStrZ2JZMlRXK3NpSGFQREI0bjJxOVJUdmpu?=
 =?utf-8?B?MkZ0b2l0R0E1ZnZoeVgzaElIZ1FHcTVnSHdVZWdTTjV6dktQSE1TNWs2ZURp?=
 =?utf-8?B?N2Jobm93dTlHRGJNc1Q4NjJCQTFzQ203RFlONnE1QWswYjhnQlEvUmxpeUF5?=
 =?utf-8?B?K3FBNUR0bHVqK1dXNGtULzVCbDQ2ekRreFhuVi9scWpIZUlEZnBLZW9yMlBL?=
 =?utf-8?B?NEFIQXR4YW83QXlyQUFabVJSSlNDVmVsemtzMGd5cjYrVEk5TC9XZGYrYlJy?=
 =?utf-8?B?OXFpTUsxWmRQWENBNStuVi9tRDllRlpZc3VaZk1FTGo1RjluUU1BRmhVcWJ5?=
 =?utf-8?B?eERlc1pFSWtHdjFvZmxub2RQU3lRYVVVblpiSyt3N002SEFRalNKRERxbncv?=
 =?utf-8?B?WHlzUC9uR3plMXdIRGdhbUJBUWRmK3FLMVk5VTkrenRVTzZVLzFUVXlvR2xX?=
 =?utf-8?B?MWZ3Q0JZd3crU2IwWmpPRWttVFVDeXBzM2VMenhjKzZiY0MxcFE2RlBUU1FG?=
 =?utf-8?B?R0lNTG1JbjdCZmw2eXNFNGY1YW10WldSTWZLY2pxZmoxbHVLSmkvbmdZcmg0?=
 =?utf-8?B?QjZheS9MblhuWkd5dXlYV3hjZUVJbFdHQkdoRGU2Y3NySjQ1YlNrcVBxMndz?=
 =?utf-8?B?anhld0xDRFJOb3lkYVduaXV4VE0xMWdRRHVDZjJoc0lzdUN2UFplK2FRdWw1?=
 =?utf-8?B?UnVXd2RwMmh0MFRuMHhKSWUyU0NXQUtuNHUvQVR4R2JhbjE3WU16SDYvaW9Z?=
 =?utf-8?B?bXZCd1lhQUxiSElwT2hRR01OWHVGVS9EbnBPSHpCbGhpVXh6UjZGOGVEM3d2?=
 =?utf-8?B?TFFycmxDWW9veDdtRytlTXN2ZkdCMVczaVByYjZrUmFBalNHSlFFZGxQbEtT?=
 =?utf-8?B?TGpzUFRoeklwdEVpZnlST1VmU2xtdks0ZlRpZHU4elNEQnIzdFVFTURxTUNW?=
 =?utf-8?B?MXQyZnJ5VFh4WTloV0NNWWRock9ZYTRzWFplSWdlWEtnZFFPTU85bFU3eVhr?=
 =?utf-8?B?K250UVY1alpJZ3JzWDU3L3Ezdy9PcWRFamljN1I2NmNNQUoybkk2Sy9qSXJJ?=
 =?utf-8?B?Ym5Zd1NnLzVvUmJITWJyd3ZuN21sbG8xck1ZZlpveWxUZnhQY0FlWDFnd0FM?=
 =?utf-8?B?bVJPRkxGV2ZXRi9WdENjOUVZOGhoK3RGSVJXNzR3NTRMdXc2NG9rK0RGYUNU?=
 =?utf-8?B?aFBRWUVCMWY1Yll4VWNJUm5NNXFURzB6Uk9sQzhnL3FoeUhaaGliaDB3Nkk5?=
 =?utf-8?B?TmdrUVpaWWdCZXoraWd6dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFJtaDdmN2FNRGxFc3I0N1VJVnZ0ZlBuQnJsSTdQU09uWHZPaFNIeXJITXlF?=
 =?utf-8?B?S2htWGNKZXNwd2U3SVltbEJJdkp5N2VTNEpaRUduVnZyb2JvakFHSmVQdU10?=
 =?utf-8?B?VXQ2dDFWL09JVWk2NUFudmhaTEVrb2FJWkJJZFhBdlN4OUN6M255UkVUYmZv?=
 =?utf-8?B?djVBTGNmNzYwb1NpQTk4WVJvaGJrRDBKUDAyZnJVOXJoS3dJc1BueFBYRmZD?=
 =?utf-8?B?ejIwTHRxVlFCckRZOXlSaHJRMHlRUUJlMnFIY3lwTWx4L1lDV3BWaDNyN2Ex?=
 =?utf-8?B?VjQ0cnRvcSttNHpkeExNdFdLbDI2dWRjSTgrRTI1S0Z2c3FTQ1Ftb0F0T0gw?=
 =?utf-8?B?cHFwakU2eWZBWm51eDY4ZUtaaE5ZRWkyTWJSczltVHRrb01JWUVOak9rVlFx?=
 =?utf-8?B?cllGYzZKZkJtcHpzcUFzWHQra3ZqbnM5U0Vpc2NvSHZHRTNPbFJSaVdiSTFN?=
 =?utf-8?B?Q0VPOVRUR1NZSG56OGZiQXduc0NQeTF0Mi84cUdDSndKWjRXZ3NxeUh2YlZ6?=
 =?utf-8?B?anEyS1kwdWV4ZlpMTW1COFJvc3Q5eWFUME1QbWF0MGtScWp5dVRYaWl4QXdt?=
 =?utf-8?B?T3dxNFYxZ29LYTMrdDhjWHMweElQNHV5YXpiaFdyVWlJSm1mdUYrV2dINzFj?=
 =?utf-8?B?Ym5mb2dmczNQdmtmNWp3cnhYcUN3cHVERXRBN2FyOGNpUUNWUytOMFo3T2tE?=
 =?utf-8?B?R1JLSGYrTXpwbVpjbmc4SThwLzdWSjdMZXc5bGl5Y0VjVW9zY3N2bDYxa3NK?=
 =?utf-8?B?dUJELzgwMW5WSnc5MkNoeWJPREJHYlR1bVl0VFEwK2FHWVl1a2I1d3VzU1BR?=
 =?utf-8?B?NkMxOC9YOTdjdVJpZlNXZ3hzYk11Z01zM1pzUnlWY2VIRm9wenZIKzg5dEVQ?=
 =?utf-8?B?WUpTRkQ0dGN2WEtJSGdqTkJwQTFHVXRQUDNDT0J6aVczbk1DT2NGazVGejgx?=
 =?utf-8?B?d1F4UG5ZS2NhRitBL2FycllVbDl0SmdkMDNxQ0VaUUNkcnpWbFZnemhrcDli?=
 =?utf-8?B?UitCV3V4RG4rVEdSN1J2bjhYYzRBb2lYT2xWMXBjTGhVS2xaWi8ycmFodlJO?=
 =?utf-8?B?ZmZRUnFlWGU1R29ON3h0TGQ0b1U4WWE2Q0pWbXoxNlZ2eHB6RE1xbXJqbEpt?=
 =?utf-8?B?SWFXcHlickNwU3ZiOFcvL3NYY3lLYjRLaG5UMDlRVjV5dENhNGl5dlIxR2hE?=
 =?utf-8?B?dmtMMGpRS01DZkZWZ1RXTlJPUnAxbktJQ0pBb1p2bmd1L2g3ZksxMFBQWDNm?=
 =?utf-8?B?ODBrZmVmM3ZJK1dtK3BuK0Y0TzJ0Ukl3UkhEaDhlam96REJsMU9XVzd5NG5P?=
 =?utf-8?B?QmxkeSsrSmhhWlFzb1pQRlFUMVdWeUk3aXpmVTErMk1FRmNIeHdYemRYNENZ?=
 =?utf-8?B?enBaZC9XTmFQTVNMVVV1S0VsMFdJVm9SUlljNDNadW1NT0Mwdk9QaDNoMi9S?=
 =?utf-8?B?bFJ0SXNUWlRLMmxtWHFadCtSd0xhSzVJZ29aYVMzL1licXFKbHZQbjZOUmFW?=
 =?utf-8?B?Tnp1RVFnRlZzL3hJS2Z5TUR4QXloZDc1cGI4UXRyRm1lM3psUlVNdnIvOG9Y?=
 =?utf-8?B?MmpSa0lrS2pCbitUMjF4K09GNnpHTSt4WmlKRkpueGkyMjAvVWVzSFNlMDJM?=
 =?utf-8?B?RGs1T0IrbWY3dFJ6aHV4N1pDb2kzQzNUWW1BZXBtYWpBTU9aa2U3d1VQa3Y4?=
 =?utf-8?B?YkxHWU9lY2tUS0pNd0xXQzRGUDd3WHp0L1hjSDhRdWVHNDBiYW9lOFNiZU9r?=
 =?utf-8?B?TDlVRUwwMTBKNFg5VlNHZkVUQzlBdDNJUEg5bDNCc2RLeFRqNWhUK1RTQ01t?=
 =?utf-8?B?cEhOL1k3dzk5L0JLaDYwbU8xTUNKaXZlNDdrUGl0bUFBMnNSU0RSQnF4MEND?=
 =?utf-8?B?d3pTZngyYUtOc2g4L1NvTUNhZVNKVGIxUzhPQ2hkZHNzRXBBellSL2pNODNx?=
 =?utf-8?B?US9OSXdZZ1ZrN1JtRlU0Zlc4STB5Uk9CSENDdzdoOERQQU5BbGpnY3R1ZEJ6?=
 =?utf-8?B?NmFvVlRMUlUwdkJ4ZFVIRGFsYUtvOHladzB3TDZIQkVUN1BWY2FBWk9XcUhv?=
 =?utf-8?B?UEQ3S1NLR0NMS1hGQ0lvRWN5WXZIU3kwUHZscjNsQm0vMUJ2K3RySXNQYlY4?=
 =?utf-8?B?cld1b2pEcFcxbmwrL2ZyYjhqRzNRSFF0ODB2VXcxaUdpbkI3aVI4NlpidjE3?=
 =?utf-8?Q?Oenlqc1PbCk2KP+fzo+knWg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b9fc40-70a5-4b15-f197-08dcab2e577a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 15:44:30.7237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMd5lqBW4VRHQNByRaiQfJwyZWiQYoaj9k5hdCBP0ptwN6bsO48N78RUGjnE8NqdmGp6B9QBojoRF/sEIv/muop4S8VvprGMfEaUVfuOTsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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



On 23-07-2024 17:31, Gustavo Sousa wrote:
> The implementations for xe_mmio_wait32() and xe_mmio_wait32_not() are
> almost identical. Let is avoid duplication of logic by having them
               seems typo ^

> calling a common __xe_mmio_wait32() function.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 103 +++++++++++++----------------------
>   1 file changed, 39 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ea3c37d3e13f..955ca6940161 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -278,37 +278,24 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
>   	return (u64)udw << 32 | ldw;
>   }
>   
> -/**
> - * xe_mmio_wait32() - Wait for a register to match the desired masked value
> - * @gt: MMIO target GT
> - * @reg: register to read value from
> - * @mask: mask to be applied to the value read from the register
> - * @val: desired value after applying the mask
> - * @timeout_us: time out after this period of time. Wait logic tries to be
> - * smart, applying an exponential backoff until @timeout_us is reached.
> - * @out_val: if not NULL, points where to store the last unmasked value
> - * @atomic: needs to be true if calling from an atomic context
> - *
> - * This function polls for the desired masked value and returns zero on success
> - * or -ETIMEDOUT if timed out.
> - *
> - * Note that @timeout_us represents the minimum amount of time to wait before
> - * giving up. The actual time taken by this function can be a little more than
> - * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
> - * it is possible that this function succeeds even after @timeout_us has passed.
> - */
> -int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -		   u32 *out_val, bool atomic)
> +static int __xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +			    u32 *out_val, bool atomic, bool expect_match)
>   {
>   	ktime_t cur = ktime_get_raw();
>   	const ktime_t end = ktime_add_us(cur, timeout_us);
>   	int ret = -ETIMEDOUT;
>   	s64 wait = 10;
>   	u32 read;
> +	bool check;
>   
>   	for (;;) {
>   		read = xe_mmio_read32(gt, reg);
> -		if ((read & mask) == val) {
> +
> +		check = (read & mask) == val;
> +		if (!expect_match)
> +			check = !check;
> +
> +		if (check) {
>   			ret = 0;
>   			break;
>   		}
> @@ -329,7 +316,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
>   
>   	if (ret != 0) {
>   		read = xe_mmio_read32(gt, reg);
> -		if ((read & mask) == val)
> +
> +		check = (read & mask) == val;
> +		if (!expect_match)
> +			check = !check;
> +
> +		if (check)
>   			ret = 0;
>   	}
>   
> @@ -340,62 +332,45 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 t
>   }
>   
>   /**
> - * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
> + * xe_mmio_wait32() - Wait for a register to match the desired masked value
>    * @gt: MMIO target GT
>    * @reg: register to read value from
>    * @mask: mask to be applied to the value read from the register
> - * @val: value to match after applying the mask
> + * @val: desired value after applying the mask
>    * @timeout_us: time out after this period of time. Wait logic tries to be
>    * smart, applying an exponential backoff until @timeout_us is reached.
>    * @out_val: if not NULL, points where to store the last unmasked value
>    * @atomic: needs to be true if calling from an atomic context
>    *
> - * This function polls for a masked value to change from a given value and
> - * returns zero on success or -ETIMEDOUT if timed out.
> + * This function polls for the desired masked value and returns zero on success
> + * or -ETIMEDOUT if timed out.
>    *
>    * Note that @timeout_us represents the minimum amount of time to wait before
>    * giving up. The actual time taken by this function can be a little more than
>    * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
>    * it is possible that this function succeeds even after @timeout_us has passed.
>    */
> +int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +		   u32 *out_val, bool atomic)
> +{
> +	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, true);
> +}
> +
> +/**
> + * xe_mmio_wait32_not() - Wait for a register to return anything other than the given masked value
> + * @gt: MMIO target GT
> + * @reg: register to read value from
> + * @mask: mask to be applied to the value read from the register
> + * @val: value to not to be matched after applying the mask

value not to be matched

> + * @timeout_us: time out after this period of time
> + * @out_val: if not NULL, points where to store the last unmasked value
> + * @atomic: needs to be true if calling from an atomic context
> + *
> + * This function works exactly like xe_mmio_wait32() with the exception that
> + * @val is expected not to be matched.
> + */
>   int xe_mmio_wait32_not(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>   		       u32 *out_val, bool atomic)
>   {
> -	ktime_t cur = ktime_get_raw();
> -	const ktime_t end = ktime_add_us(cur, timeout_us);
> -	int ret = -ETIMEDOUT;
> -	s64 wait = 10;
> -	u32 read;
> -
> -	for (;;) {
> -		read = xe_mmio_read32(gt, reg);
> -		if ((read & mask) != val) {
> -			ret = 0;
> -			break;
> -		}
> -
> -		cur = ktime_get_raw();
> -		if (!ktime_before(cur, end))
> -			break;
> -
> -		if (ktime_after(ktime_add_us(cur, wait), end))
> -			wait = ktime_us_delta(end, cur);
> -
> -		if (atomic)
> -			udelay(wait);
> -		else
> -			usleep_range(wait, wait << 1);
> -		wait <<= 1;
> -	}
> -
> -	if (ret != 0) {
> -		read = xe_mmio_read32(gt, reg);
> -		if ((read & mask) != val)
> -			ret = 0;
> -	}
> -
> -	if (out_val)
> -		*out_val = read;
> -
> -	return ret;
> +	return __xe_mmio_wait32(gt, reg, mask, val, timeout_us, out_val, atomic, false);

With nits addressed. Patch LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   }
