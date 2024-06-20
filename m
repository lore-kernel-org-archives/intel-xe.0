Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BE8C2BA18
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B910E040;
	Thu, 20 Jun 2024 10:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixC6Ro0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32410E040
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718877812; x=1750413812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cVq8tozx50wKO55QPuJ1FGHfn83FazHfkLkSo5obx5s=;
 b=ixC6Ro0QjSO1zjA8yfpzkqzFW4W1uFJxTy/Z9fDL5T8R8zSJxAAmJ32A
 hLbdMzINJk/Ubg06BLhUhpNVGaJe61sQ+qMN4AQXlqzBF59tVdl2w8NrC
 setvD2rT8xVDpN6hh5kJ748CnrOQSJGQS1sDGH72BvYUJ7ap2JX1+WhM5
 Furb98dn5S4jmFNNSBehyrCUKP88NOAOan6nRRyJjz9/aalalWNbBj9H6
 zDNSrGyJmit0zHiBKWa4OkLfI7khffKG9fAnKX37dYWDkMm4wveSgpwcV
 9BGyV1GfT0dk3vogOTuhnKPyxSIkeuN7Kx/C77f/CzLNS3wr72/H0x11q Q==;
X-CSE-ConnectionGUID: yiiEaCSvSHyG2a5zJ603Yg==
X-CSE-MsgGUID: MB2HORvTTPmvvRAkSutxZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15673470"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15673470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:03:31 -0700
X-CSE-ConnectionGUID: swgkuL71Rn+jXEDuMIAbOQ==
X-CSE-MsgGUID: Jooj/ja3S0SDXTkJLspYBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42874613"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 03:03:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:03:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:03:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 03:03:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 03:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKe2XVlvJ5RsYqd3gHuRGKG6MJwGRcIiMLAvqukUVK7vkzrGA/13JjJA+4hR2XSEzAR3WM0aJop9Woy8yNX9X4OA5AoIDH8bkbvzya6KWZpJenqMXZW5agYay3Vw2pC2/EboKINSFiOr4vZnvGOZM1V1efE7AD//nSBQVb9ZsmolzD4MvidBv6dsgBQiECOEISDhJg5Mr2n0dm8i2rc67gPmZziQWmdI4llqInQHv6NBGfdMMCZ+SQhu3+VmmXGFC5kJQsOob/TlNWfyqlAiLumw9NLqINGtN4EhF8H/7pK768c2xPB/wew2Ps0vCF8FoPy1Zi6mGAnmcjlp4z7ZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSmJpU7F0t0rrJJ+2fgC7KVZ9gGi3AmSQWJkh73teL0=;
 b=YgK4EUNUDr9MmZgz6yBd5V3CDQQloDRhzU9L+zHiJ6QMCQS6L6GobPHQU4fonjI2qqwAbkEUf9qbMSgvGTJvDdIJunXIpsSt1afdvnEAGPYd2n80KTRmnWGgf8ObVLv9GjKYzdVpBZIuL219EDDiYDHBwxWAgjjPbBFfw+7PTK1IFIFkA5xo2PmXSLZxk/Z2E32Q/4EQJ+IAOW3/Jw6P/MK4Z9AMIeykxNZnCr/CjSCKGl+0htHSeXyEpZe9hPLbopoQ9cQHhq73Rvp8dQqo5a34DRVSOtFenRFfiZfE0U8SaC1RRNiKmKRZwLsEw9+1scDABDpATKjpaHDUCNrywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Thu, 20 Jun
 2024 10:03:22 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 10:03:22 +0000
Date: Thu, 20 Jun 2024 12:03:19 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/9] drm/xe/vf: Skip engine ring enabling if VF
Message-ID: <20240620100319.45bf36dli5abgokf@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-9-michal.wajdeczko@intel.com>
X-ClientProxiedBy: ZR0P278CA0053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: a6766328-fca5-4dd6-8cac-08dc911037f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0xoRmh2cWo1Q1R1R0xlWlVmTXYvK0hnRzgyWHh1YWNVZzdjcDJZdDNCazFZ?=
 =?utf-8?B?VXBJSFI4TFFQY1R3TnBkb2VIa0hvTGY3aE1uY29KTGF4QUgwM3g1TURtblhI?=
 =?utf-8?B?Z1dtOCtuUXBEajZyREJValhSUnVJMFBGL3RZdHhZb1U1ZTBZZDJ5bS9JdVFD?=
 =?utf-8?B?RFZvTDBINzFmaFdJVmVNYlc3V0dNQzRuNFp6eVp3emxRaWp4UkpnaWdhZmRN?=
 =?utf-8?B?bDBaNTB6RlByUWlhcmxRMGZVaXRDbnlkMU5xODJOeUNicHFzNUtkTXh2RENs?=
 =?utf-8?B?bXpjVnkxaDcyQS9XSXh4OHQwMkpsUTNWSW5WZHVYdXFaWmRGbFhZRmxHbVVa?=
 =?utf-8?B?SHJhQ29VUG9td1o4SXRZUFlNa2FkSlNOTVErck05WWZsTVk4WGVzdGRTV0Nx?=
 =?utf-8?B?WUVxbEFaZElOM1lDSTBZaEdBbWF0RmRkclZEZ0U3NzRoVjlZUmRKZGRDTEtZ?=
 =?utf-8?B?Z002bDNtT0FsTXlhUDJIU1F0a1hLL1dpRlp2WEwzU2N3d0duL2Y2SDBncjdv?=
 =?utf-8?B?Z1B0T3NrMlJRZ3JUUk1TVmJOZjlVVVBWZzRYcWg1QlZpc29jZFdOVXVCdmdG?=
 =?utf-8?B?ei9lNGpLQUI5SlMrdFp6R1lwbWt6ZCtkWHlBMitsMVFlUForbVlCVUx0UzdQ?=
 =?utf-8?B?a1JVK3djcjFwZTIvSkF1S0d2a0tsU2pWc3ZSVWFOVGVEL1FyM2Q1SHBHS1Yw?=
 =?utf-8?B?bHhvQU1tQ3lJbXZxaVBBZ01XU1QySktlMXV4czFJM3ZxZlpEWmltcUJvTzcv?=
 =?utf-8?B?MTN1NlQ1MTRRNUN2YUlNa1hrOEVFN2ZhL2xEaG9tak5OL1VwWnQ2SlV3ZDVU?=
 =?utf-8?B?KzdtdkZtSVYrZGNFN3QwbXFYZzg5WHd4VmpadUQ3Yk9tWnNZMEswb1ZGdlJZ?=
 =?utf-8?B?WEhwTUVCeWU2Q3lzRU96V1VOc2YvaEp6R2dpdGgrMlJxR3p1eHlGenZlZndy?=
 =?utf-8?B?UzZVNkg3VXZxY1V4Y2hSQ3hhSTV2UStrUFE4L3RKd3JFbkdRMFdyZlVBa1FN?=
 =?utf-8?B?SXRQbmNvWU9BS0Z2NG1GUThrMUZmb0Y4QWJFc0lmWUcwbEpVQ0VaMHJyckhP?=
 =?utf-8?B?VUNFSFFmT1ZWNm8xdEx6ZHVtOEovYlc0Z0RIQkw3bWk4cHMvbXVEVzlpQVdx?=
 =?utf-8?B?ekk2T1VpVTNORTdLMjFNaWM2MTFxR1FpN0NYakFBSXBVeVZvMWxhRTdOZFNY?=
 =?utf-8?B?SnY3a1VFTWpCUUdlTTlmWFhaRmgwVDF4MjllbFZrMTNNVVBrdFFBQlZwTVFy?=
 =?utf-8?B?VFpjTVF0Vkp0THpvSHpZOC93Mmk5ODd3UU80bGNyZHh1UmhFWHBTNlg0a0w5?=
 =?utf-8?B?dnVURzdEUkxDUVFNRll0UkhXTExETmo1Sk1zbmxuMWNDMCtheGQ0VVd3VkJp?=
 =?utf-8?B?bW14dW5VeXVyWHp2T3BacW5XVlJSNHJDeVlOWTB6cHluWlQ4aGE0eDdQQlA5?=
 =?utf-8?B?dkM1ZEVIWTlzSnVIMmpsRldQTjRIQjQ1ZzQwM0dYQlIrUUszbDNBQzVNNWpu?=
 =?utf-8?B?elNwK2JlZ2pidUxQSG96czIvbVExT0VZS3MzcktOeStEMlZpNkRlSndJUEN4?=
 =?utf-8?B?c3VzRFYxTWs4OTRydkEzWGszcW9hRUN4TElVUTRhekJ5Q0JrUTZWMFVGL1JZ?=
 =?utf-8?B?WncxRGZ2QXNzdGtmakQyTmRqVEZoaUFNaTcvUjZVbHNDVDNlUVJJdnFYT05M?=
 =?utf-8?B?SS9SQ2NSZmQwcjFjc2JTVm9hVzlNSGJ4LzhZa2RkUmJ2K1ozandReFVRWDZi?=
 =?utf-8?Q?9pDmmPjr/o3tvCdpXLU1Kn8QPvSFRzaSyxTXnJQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklDa2NBTDFHMlVJSjVNc2NLM3RRZkc5M2pMVUhqWklXNVBTa2E1SGhITmpE?=
 =?utf-8?B?YlpkVzdiRnpmckZrVEo4MHROd1p5bGRSMTVEa1FyNWJtdUdVM1o0WGtMUElE?=
 =?utf-8?B?VVBEK2ZOLzI1a0Naek13R1pFekkzelNKNXdGcmQwR3lvdEtEbUV3QUFhdFlW?=
 =?utf-8?B?K1NOUnVqd2J6SFVqUHc3d29nTDdTMFNxYityajBEcC9INzRWUTZ3MTlHNGkv?=
 =?utf-8?B?bmJzMjJWV1VLc0gyNjlwQzZxQ0RMaXpLZnloME10NlNoTE9td3J2NDdjaDls?=
 =?utf-8?B?cnM2T3JtYk40THRIbk51UEdvSVBsYnFRNEVSOStzUlZMNG1BeEp5WDQ1TlJE?=
 =?utf-8?B?bTlITDNRVWVKQm9ObWx4d2xxWVhsM0xNUWZiTUl1ZGZvU1FNVkJOeUZyUW5i?=
 =?utf-8?B?OGltZC9tVXBGM1BzeDMzcWo1bDJ4ekEyczRFWFg2RVZTZ3hjOG91RDF1dXhG?=
 =?utf-8?B?RUFqWFBiRlhqSldWRFk4WHhTaGtwVXBaR0lUMStlVFY2M3ZOcmx4Zk1ObGxB?=
 =?utf-8?B?UC9HQktUTXVJK3dVWHhFMTl2RFNoQlRqSjRhMjUwQURHR2E1WmVQREkzNklz?=
 =?utf-8?B?TVc5TGVCRjdwc2o0RFp4SVUxUHIyNUtwSlNtdDVCZ3dMckxJMW1uUG44Q0VB?=
 =?utf-8?B?SnBkTnNKM1BacUMyZ0hEQlBkOWlPbHpKd3c4R2oxbEdkNzZQM2V6NXJ0eC9v?=
 =?utf-8?B?cUpLOEQ2RC9haFVRQzVmRnVGMXMyV2ZMa283ekQzNHlSM1VYVE9iSXlpaDQw?=
 =?utf-8?B?aEd4TzdOVGRKdWRiR1o0cmp2elYremtjMG12S3AvKzFCTnVnN081ckVjVXZh?=
 =?utf-8?B?V2FLa3JJVm1OOU91QzhacmV2bHo1OXdyb05HcjBrd3IxcmhoUE9SZ0hDdDQ4?=
 =?utf-8?B?bERQVnJLS1N1NU5DSjVpdTNBZk44MC94MVNPQ0NRTGwzSEdyVlk3LzhXL2Mx?=
 =?utf-8?B?cTF6aHkrS05XemxCUVppdDQ0UUdyS3AvYnJxek5IcktqVmV0akhSY2tja3Ur?=
 =?utf-8?B?WHFXZW5HRVFXQXNHQ2FhM2JZZ2xVRWwrU3NQeFJYRnBDbmIxV3hMWmllaTB3?=
 =?utf-8?B?REtNVFlKTjBwNGtDeDZwbmp4bkJGa3VBTlVWVDRtTkU5OXk3VXJWMXhjM1BG?=
 =?utf-8?B?M0xnTmJCQ24rMFh2TlRNd1p0WGJPdnZwdTEzVENiSlZBcllUd2YrUzhDaTBV?=
 =?utf-8?B?TUpZeDNKOXcwQkJhTy9oQmxIenlsNmdCNzFsMWNzOHhXS2g4bWUvQnBlMkJV?=
 =?utf-8?B?ai92ZHczZkpyZmFvQjduRXV4RU9Hc3dVN3pCK1Zvek1VVEJwZi90TXdUNS8x?=
 =?utf-8?B?UEtFVDlJTjA5YnBsWU9IbzQ5R1JUNE1FL21UeFcxdEVyU2ZvNzVIMVBJN3Nn?=
 =?utf-8?B?WlgyWUtlS1l5Mko2SUl0VnBBRVpmQWxWb0dVRFdlaGVoc3RTYzI5R2FTQkNS?=
 =?utf-8?B?SGRiaVEyQkp1TGhxeFFnU1U4SVhSbXBkTEtGTld0SEhWMEN2R0VJaUNxMVNW?=
 =?utf-8?B?NWtQalZRaDMxT25DWnpNWkNHK3Q3bStnUXdhMzNKdE5OZEEwODNqUE5OYzlR?=
 =?utf-8?B?ZnFlekc1cFl5eEExcGdCckdnTmIrdUlVUHpnQjlZRlpKZjk5NnpMU2RuVC9F?=
 =?utf-8?B?SXJuTHNnZWxEc0JJN2ljWlRuYXdvQUxvUS9hcXZNeXF4bGJ1Mmo4N01UYmQz?=
 =?utf-8?B?ZVRpb1ljTlI0WVBnOHJpSlFvdFdjdFFnNUtkUFplK1dpakNLYVdlRVAyUEpy?=
 =?utf-8?B?NmNsKzdIcWNBd1k0RUlTUjhSWTMzMXJFWUp4MGt3OGlvRFFhbG9aU1FIQVRy?=
 =?utf-8?B?MGoyNVBWNjkwNjJ2cm5ueHd1SFF2dnRpNzgvci83Z3hHMENqdXB3Qy82TmdX?=
 =?utf-8?B?dkpRWjExdlRPQmIwdHA1ajhmRnBsRFcxbjI1YXJDR1VMUWFjcDhHYllCaktj?=
 =?utf-8?B?RHJqZ0FtUnZnck50dTRQSUJ3S0xPS29OZ3NudWtuZE9TUWhWLzdJQXdtbE5u?=
 =?utf-8?B?aHg2SmU1QVR2OTU5T3BCMkN5TnZ3MUV6eUdlb2c3Qk16YUxrVHIwbGJjaFN0?=
 =?utf-8?B?UFVrZlBEeGNzc0RHVUU3d3IxVzV3Y01acmZsS0JVVWw1TjlWSFgyQUdMVEVr?=
 =?utf-8?B?YVlWMUdUSmQ4T1ViM0Q0VkVHcG0zclNQVXhsYzRkNHNQNGY4RXRDUHgydSt3?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6766328-fca5-4dd6-8cac-08dc911037f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 10:03:22.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: peEbWvAMqHB/unXY2R2rLdmYgy8m/WTnw/r/2aVI0RlfinwknMVzMywRJnJEnY2rsoey4ABPxgIPhUEjmiaGv+9UYvs90xZprwfD8H3Lrls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:56 +0200]:
> All engines will be correctly initialized by the PF driver.
> Moreover, VF drivers can't access related engine registers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 52f12009678e..78b50d3a6501 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -547,7 +547,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  		if (hwe->class == XE_ENGINE_CLASS_OTHER)
>  			hwe->irq_handler = xe_gsc_hwe_irq_handler;
>  
> -		xe_hw_engine_enable_ring(hwe);
> +		if (!IS_SRIOV_VF(xe))
> +			xe_hw_engine_enable_ring(hwe);
>  	}
>  
>  	/* We reserve the highest BCS instance for USM */

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
