Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB9CAC587
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FCB10E768;
	Tue,  9 Sep 2025 13:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oyz+yN8E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938F10E768
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425836; x=1788961836;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=PjZF5K2+fpAe/elRxX8wjWh91V70CqdYLjF5t9esuro=;
 b=Oyz+yN8EpE06gQzauejS+7YwEdZRaMe3QVRIKRJWS9bURD2PhXHN4I32
 18nq5sgROIKUooQL97FlCdJHdKzUeWAXuqP3MkwhiJurPFdtHQiHT/1UM
 niONE0yg4nCRyiY/KiiTCJinXoI6ms/NkvTky2daR+U7H4YRd9tCmTdzs
 bNg+NxFYyz9h72OnNHsPKzdxUanttfZkNCetEct+BiXeFN8JibQyp21FV
 r3rLPjgDKmza+q6Dq01HbgtnAbxOwOjUv/EKEXEeDQNDUcV1JNjceUWo1
 6pG+nqOtB0qiLGNVvHzW8Umi6I1UyuWitIgdxJPNLUA05tNvdjyWSjtSU Q==;
X-CSE-ConnectionGUID: geSfpxJxTYmHhtjHObU5bw==
X-CSE-MsgGUID: nQwDDgYXSuSrcyEyCHlOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63346511"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63346511"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:50:36 -0700
X-CSE-ConnectionGUID: jCFhxAZXRw+0FG9BORL9Kg==
X-CSE-MsgGUID: 87Aq3o4fQH+9hmLft7kNjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173877272"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:50:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:50:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:50:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.73)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuB58Sw73p8zB2lA/fimUaqnkWq/lEsSCW7jRmYT2/QCO6/yxMO6MBR3Gu2wiiDz0YvO8oXM0LQ/K2ldgE3SB4a6mliuFysD/2xLAU2/naKo217GX5VVHlEfNp4PeWRlMFH43F+hoJw1yCJ1esfsgVVHl30dh3rNVH5HRxDacD4nwO5e15TjkxB//1WduM1Ya5kIIdxJ1MKDqcA1CXqqAoQJi/Ihne7QsWbgErQWguTJtgGhfOu6cPCjndJdCRM2GMAUsDpaavp7GpVzrLYQbAR6bRDyA2b1z9mz1twUa4sNMHqAFDN6rPBP4HL1NxLKbAvngqBlWtiV9YsZZ0S2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNjX1705h6fzDscMQDz7oD02UeNlqX7hmwyGbG6iF/A=;
 b=d1obXa8MocbEGCLcQBITGx0k54DXW+hV376Z9lA9eUcZIEHU6XP2BuyYV3DckrYCo1Z9dG8LTI4IDDX7b0uOXa51UF11UpKGUGqf3RL+KroD6+9OOATNyhrQf40EklQlmXuhrEN1xKw2QbAn9HnMKVu9EkIjnyNrkypNFikzrS7qiXGtxg6NisBjg+GWsoISeMQqc24NxnViqm589RSX9bm8ijdgnr2ta+dzCLqeoyeuZhTYsJAOUQ6nFdQZ9L/nguvlygtJpalOVpukzy6baIfW4je2JBT2Q9mPL9xC7zcoy57Jz1/+VpgX9CqymhDV8CAcfmYaz+JuV8k99l0qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:50:31 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:50:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250905215614.796247-4-matthew.d.roper@intel.com>
References: <20250905215614.796247-3-matthew.d.roper@intel.com>
 <20250905215614.796247-4-matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe3: Correct L3 bank mask readout
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Francois Dugast <francois.dugast@intel.com>, 
 Fei Yang <fei.yang@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 9 Sep 2025 10:50:26 -0300
Message-ID: <175742582620.1838.11677776839913024194@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a0883c-9d17-4a7b-b636-08ddefa7d772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWtXdzd5OENxcGhlLzl5Ym5JTEJHTFBXVTlScklmblJzZE9qNU1haGZVZG1p?=
 =?utf-8?B?UnoxRzJDUDgwL0ZhWitvekZNZ2lGQjY2WW5OTHdqVjljd0ZVOWd4N0NvdGVR?=
 =?utf-8?B?TW01MC9rSFJ4dDl2eTg1aGRERkJKeUJQcEJSMFJMTkNUYjJCdzdMZTArYW9t?=
 =?utf-8?B?UWsyY3VZM0c0YmJpTjgxaUVZZVhKZW4xZkYyWWFpOGNrY2wvTWZOVmNzWDJX?=
 =?utf-8?B?ZVl6S1dsL09zaFlaY0lWNGQrTlIvcnVoaXJibFJEY1JmbkhkYm1IQW1tRmRX?=
 =?utf-8?B?YnFLaHE5UFR2NEdtdFpZWExuViszTzUwT2NpOSsxQTF5S05ia1REVURocTRV?=
 =?utf-8?B?MEFpNnptb0IxNzdYWEJjTG5yalN1cEY4NzI1ZjFkTmJpNE5QbGtvZHc3b2Fa?=
 =?utf-8?B?NmJuWEpJN3BmY1p0VHlucW8wZ3g2RkQ5UE8yZ3dmc0JsZzZQc2t4WFltUFJz?=
 =?utf-8?B?R00vOUttc3dOVXRxSWIyaWxqZVBSN21abHBCak5jbFh5QWNzakRiQU5LRW9U?=
 =?utf-8?B?M1AwQTZtdWFYQ2p4cU92TVVUU1NCbXdZQmR1VmpUVGZUdnl6UURJU042Q0h1?=
 =?utf-8?B?aGFKam1Db2xTRk15QW9LTzNEMVpxb0o3Z2R0N0tranB5ZjlRWnNiQmp6NStm?=
 =?utf-8?B?UVlhbG02K3FEN0p6cGJFU2oxOEF4OXlTY0ZSMWFsUlJQTFpBVzNrTXNlUzBL?=
 =?utf-8?B?eFdEOWxRN1dxbXpJOGNIRTZEcXBvUVF4elo5VldvbzdBRzBab0xBZ0s3QUQr?=
 =?utf-8?B?VWhTMUpHSXNaeldwcWJPMWtiR1A3ZEtCcFczUlhHMVJuMWRqUkEzeFdURWVD?=
 =?utf-8?B?YkRXZmZQbDJMZW1hWkR2SDF3TnJwdllqUDlWSFhMcEFSRU53WDBiTXNKZnlz?=
 =?utf-8?B?ZWFTZzdiSklWMU5IZVZUSmV1RWhHMy9qT2xEeisvT09NYjY2ck5TMi9kVDZh?=
 =?utf-8?B?RnlTVndYaVVhRi9nbGJxTnh3bGFGWDUyajR1YkN2QmZ2NHpTN3pMcmxVWExD?=
 =?utf-8?B?WU9UUm5UU1NGQ3ZtNnc0M1R1Y3BCSUYyMTB2MHM2RHl2RDREc1NZSVpza05U?=
 =?utf-8?B?dEFWWVRIZk9qRmFUTk0vMEJSbUtaMk42Uk5TUjJEZEEwMjlUUE9wTG9wR1ho?=
 =?utf-8?B?dmVCb2IwVkVjeXpXZmZuRWNRVzNUcmpqaUhqRFZFQjFBZll5UnhxY0ozMFRj?=
 =?utf-8?B?VmU1RVlIbEM5R2sxM3ZKaGhLcUhmN0hlTCtPY041aytzN2pOKzJWR1ZKQlRl?=
 =?utf-8?B?Wk9oaWVaanZ6Mkg4Z3MrR0JEQ3k0VkFIMllIcDNSdGkySWthL3pTUUQ1ZGRE?=
 =?utf-8?B?T214R2dJQ0Eyc1MvV1JpaFdMRGtsQkVsVkQ1UjFGVWdVZ25vWHI1UEZTdUky?=
 =?utf-8?B?cmYxRDF2cUhRYnJwa1lWYkNCZVRENzZ6TnNhQU4xakJVUE1YSHpUcTl1aTBP?=
 =?utf-8?B?Qm1oQmdOOUgveit4ekVEV016RU94MjhFbHZGMzc0QlBNUWNuZy9SSVR4WUNO?=
 =?utf-8?B?aFlIOVBBUmMyWStkTlFBQnBIYUZxN0R1QTBBaDU0ZFowSnFuOXFBbm1xanJh?=
 =?utf-8?B?ekgrTUdTK1hRUWtzcHBmaW04ZGlNUkRvUEk4eFBvUG0wNW1DNXJPbzBPaFFy?=
 =?utf-8?B?UkF2dDNJazE0RGJVZm9QbjBiUm5iNFFlUXN2U2x1SlJkK1NzTUpJcjFZR2Nj?=
 =?utf-8?B?NkJJWkYxNXp3UloyZXdrbHU3cFlES2FiZ2I4V2N0Q2w0NWFDY2dSSUJ4Rml6?=
 =?utf-8?B?OFNId3FoaFd2dDhGMmxjRjh1NncyMzVRTDZPeC85c1Y3d09GNlhjM1p2bTFK?=
 =?utf-8?B?aitra0RGWlIrN0lqZmF5bVFkcHhGUEhiWnd4L2Z4WTJ2Z2NXUzMyQ1ppQUxq?=
 =?utf-8?B?SVBUUzlUV25zQ1V6ZitxdFlpby9OMkN3SVkxY3ZrNGN0elFHSGF6VlVTYk9R?=
 =?utf-8?Q?RAkrGEr1epI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXljT3RXeG1zSGJZSnFLblRKcGlkaWhXUHdrYm5OMmFSVm5tME9FVXR0SkNn?=
 =?utf-8?B?ZWFLd2VINUVwa04yWitiWEt5RjRRRXN2T1JVZnFMR3Vzd3Z1TE1qN0VoeTZa?=
 =?utf-8?B?VXNXdGtOVi95VytkMldpOWtkVHJKVDI5U0tvNXp3RWdHTFFNZEJEN1NDT3Fy?=
 =?utf-8?B?L04veVZuY3pIUmkwbTluSUQ3QWw0NmVtMzVpTWc0Kzd2UzY4QkxHTHBWZ1FO?=
 =?utf-8?B?cjdoT1FaS1Nta3Y5ZmJ0NHR3MWN2c1oxa0t3c0dMWVo5ZGZUZ21ubWxZZFhB?=
 =?utf-8?B?bys1RVpMN3FSQkJ0ckJGQ0poVnR0WEFNQVNLKzJSWjg0SzN3WFlCZFE4Vmor?=
 =?utf-8?B?bnFSZktXVnltSFNpZWRFSTFURlMvQkltNGROeGZadE1PVS8yOVhub09SQ1Ni?=
 =?utf-8?B?Ukhod1p6WEFMOTJaa2hJeWpQVFZnKzFBd0ZrOUI0OXY0UlRtS2JpSXRqM1Vp?=
 =?utf-8?B?NVRLalNjalJHUVRlNlo5eW1SRU1XSG5uYTEvZnFCZG5MNCtVUGxJZjBLQWF0?=
 =?utf-8?B?RXdoQ2FTdnNDOE85OHNHcjhacEpTanJ1VTFTd05hZW9hdzZnU0RXZzFjQ3lP?=
 =?utf-8?B?cEp4TWdxUm9kY0FtVUgzZHh1bjNqK25NbXpzVDFPNE1GbDVNSGd1UGRHcktI?=
 =?utf-8?B?UHoxRkE4VVdPZ3J3SWtWN0Z2d1EyWDc0ZnNlTGZLY2VTNVltZ1dXWXYwVzlU?=
 =?utf-8?B?SEwyNEhSWXFCVWV3Y1NtRENRa2tyQkd4RENTejRNQkpRQVMxRjV0QUR0Qlpw?=
 =?utf-8?B?ZE91b2d5ekVRR29Ja2g3Y3hraVVNdGJkUEx3ZXBCbEdxK3BkUFZQbGJPNENx?=
 =?utf-8?B?TW1teXZaelJJbE5TVkg5RXN5WkFOSEdYa1RJYkd1V0JYQzkydlFNVW1OQXlI?=
 =?utf-8?B?dmJzaDIzVmVQdENSZVk3blgzUVFUZzBGUDU2QkNmMlArM1Y5NFdHTXZNa1Bq?=
 =?utf-8?B?OFA5YzJPVzdSU1BCZWE3S294bmtqSWhMZVVrU3YyM2RHSUhWMTdQWWtCcGFC?=
 =?utf-8?B?Z21vYm1UVDVyUHlyQUVDSlpCMlNrR1ZEUVgwUzh3cStVWjhIdzhtVTNtdmJr?=
 =?utf-8?B?amZGS0w2ajlTeWZTNkFOUzBiRVQxL2xRa1dub1NKNzBrd1dMNDBlV1lSQ0c1?=
 =?utf-8?B?MklzbDhTc0ZpNTNxNVlGTWdjS0ZQTDhpSnhvNExGbHZhbVVLYko2am85OFJQ?=
 =?utf-8?B?MFlqaHZPSEF6ZTBZUk4vbGJvbWxHZ1plL3lVZU5scXp4bGgyc0ZXK2ZoOW56?=
 =?utf-8?B?Skt5dWxlUklNUXgrOGpOYmxOdGd2RVJXNW10ZFVXRnBNeWhJd3FxaHRoakZa?=
 =?utf-8?B?NnhrM1ZYbTA5UWFrRzB1T3RIRGJORnVMbWUzb2VrVWluU0cxZXdoenBoRkk2?=
 =?utf-8?B?NU9Ld2I3TVZUcE1SYU53UmxBRXYvNm92SFVXQ2tsNWpYdzM4RFJiUlV2djhG?=
 =?utf-8?B?ZUhncTEvLzlvU25DMW9sTnpqU3c2bGxHYm9tcjdzdllRZ0QvZys0UmsrMzBW?=
 =?utf-8?B?ZTFObW1Tdm1oeDRBa1A4T0hBT1dCUkljdm1WRmZhdStRMHdzajRPM3g1ZmZp?=
 =?utf-8?B?T2pDbnd4c0txbnNHS0JoU0QvUUgyelhyczFML2kvUXk1WkRxdTA1TFdRZGFZ?=
 =?utf-8?B?Q056dnBiTW1rUnF6U0lMQWF0L3VnODFTdnlVM0pSdGhTaUhKcEM0RnZ0OHNU?=
 =?utf-8?B?bUk0cDJheFhsWSt4SHNad3B6TlcxUzRYNWN3cXk2MXR5bnk0ZUx3ZlVFa2xh?=
 =?utf-8?B?ZkpNMTgvVGYzVEQvSTdGdVplYU0xNFJ2S0U4a0Q2VGNXTFh1RG1zN0NuaVJ4?=
 =?utf-8?B?emtidjQ5RVAycDJ1L0dDRDZTY05tTnZXSjBESWRNOXgwU0dpYmxVbytFcWds?=
 =?utf-8?B?dXhCYUVhQlZPaTgxOEJoakg5bWtiN3RQbVFZNnNXMGhyd0lSZFpNNW1ZVVRp?=
 =?utf-8?B?dzAzUTllb2NSRzJSNFU4S1MweitmL1k2SDVtK0xTU0pHYW85T1pXYmQxenNz?=
 =?utf-8?B?QmViamZ0VEpIZk8weHQzWFJGZGd2Q0RVTGFPTkNLUzMzN2Qyak8wMVpxNHBC?=
 =?utf-8?B?eXpIUklmWjNLU0t4dmtEUzFIaTEwaTQxSzJXQ096U3pWaGpseHo0UGdTdlBT?=
 =?utf-8?B?SFZzbkk3dDJlSDMzNm51SUM2YnVzU0VZeEJKT3FSM2Z1NklYcGJlNEpFR1ZX?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a0883c-9d17-4a7b-b636-08ddefa7d772
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:50:31.4853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTUR4Q71Jq0uVdO7Fr0WhAkZLXUPNGdXleSHn6vilk3BDSVUpGtu96ibDU94G4msgHS/aZXH2wCwo0Cb9aofAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
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

Quoting Matt Roper (2025-09-05 18:56:16-03:00)
>Our readout of L3 bank mask on Xe3 had two subtle bugs:
>
> - When the bank mask moved from 0x9118[7:4] to 0x9130[31:0], the
>   semantics changed from being a per-node mask to being a system-wide
>   mask.  I.e., the value reported by the MIRROR_L3BANK_ENABLE already
>   represents the banks across to all L3 nodes, so there's no longer any
>   need to replicate the mask multiple times, and no need to even read
>   the node mask on these platforms.
>
> - Each bit in MIRROR_L3BANK_ENABLE represents a _pair_ of banks on Xe3
>   rather than a single bank.  This means that we need to duplicate each
>   bit of the mask we read from the register when determining the real
>   bank mask.

Does this mean that we need Bspec 72573 to be updated?

>
>For userspace that only counts the number of L3 banks in the mask and
>doesn't care about the specific bit positions, these two bugs would
>often cancel each other out in many cases (since a platform with two L3
>nodes would have the hweight of the bank mask incorrectly doubled by the
>first bug, but incorrectly halved by the second bug).
>

Some Bspec references here would be nice.  Perhaps 73439?

I also thought about 72573, but the current explanation for the bits for
L3 banks on that page doesn't seem accurate with what
MIRROR_L3BANK_ENABLE represents.

>Fixes: 11a64adcdbcc ("drm/xe/xe3: Generate and store the L3 bank mask")
>Cc: Francois Dugast <francois.dugast@intel.com>
>Cc: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 11 +++++------
> 1 file changed, 5 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_g=
t_topology.c
>index 4e61c5e39bcb..53bc2bc8cbac 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -149,14 +149,13 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_=
t l3_bank_mask)
>                 return;
>=20
>         if (GRAPHICS_VER(xe) >=3D 30) {
>-                xe_l3_bank_mask_t per_node =3D {};
>-                u32 meml3_en =3D REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse=
3);
>+                xe_l3_bank_mask_t per_mask_bit =3D {};
>                 u32 mirror_l3bank_enable =3D xe_mmio_read32(mmio, MIRROR_=
L3BANK_ENABLE);
>-                u32 bank_val =3D REG_FIELD_GET(XE3_L3BANK_ENABLE, mirror_=
l3bank_enable);
>=20
>-                bitmap_from_arr32(per_node, &bank_val, 32);
>-                gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 32,
>-                                         meml3_en);
>+                /* Each bit in the mask register represents a pair of ban=
ks */
>+                bitmap_set_value8(per_mask_bit, 0x3, 0);
>+                gen_l3_mask_from_pattern(xe, l3_bank_mask, per_mask_bit, =
2,
>+                                         mirror_l3bank_enable);
>         } else if (GRAPHICS_VER(xe) >=3D 20) {
>                 xe_l3_bank_mask_t per_node =3D {};
>                 u32 meml3_en =3D REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse=
3);
>--=20
>2.51.0
>
