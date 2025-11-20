Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C187ACFA441
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 22:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D1910E073;
	Thu, 20 Nov 2025 22:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeOgEGfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF4D10E073
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 22:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763676008; x=1795212008;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OTkmzNpiBT278FZGA/rg7It9MkOPtD0CmedIlHmGQ80=;
 b=SeOgEGfaP2AoYdbHH1A+bYR2zbfm9E94L9kSVb4jHUvLYsKeQIBIocwS
 FQ7MfoyKr0pWA4L6MRjIwy6SF9MahO8y4sNql1O56XXn5zfD+NyURI6sW
 ZrnprA7SL+FNhssoq+CQQRZSdcZitspuCd9Dk9SQWCHHmqE0Uw7vYE6Zx
 XnQhZdryTsVP1HvUYVE7IFb3epDx1cZ8TxtaBPQJlikWisg3ts4AqqgIq
 3KUJ1/BP2U1oE+A7T+aS5U9uhOkJROqyKfNUZ5/MP9nrV8NxcHWpkocuU
 6oQyKkH/o8oi+IXrab5a5Vgk6AKQyCV51DLGtzws2Tyx5mCpNr9qekGCP w==;
X-CSE-ConnectionGUID: iODbiAdcRaWg14y6EILQdA==
X-CSE-MsgGUID: 6F7arDWWRiuiKybhoeScYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53334557"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="53334557"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:59:56 -0800
X-CSE-ConnectionGUID: Yk3ldbqlSHi9NqhUYzgtNw==
X-CSE-MsgGUID: oLbDMo6vSlqDRaKttGk6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="195789367"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:59:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:59:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:59:53 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:59:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bP04T02aZ1PEXqd5Wv3+gWu2/rNqtVfL5SE0FWVUqxafbcprcr2u/XwpKqrGIpz1RmjoIkQqY19fpEoid0r0NcVJ3EwhxKZsnmXENj0JAtWOuaHlW/fY6cNuFTvJjxBrs7ab8d+VR6OtudLJiw8v3yQZgw6FJXiK23xU7/mqYqEYrQYrIdiePpOPURuzfTa7UwhguvPIYTlqTwTllYJi8/zFZxRk1a6wE/IPpZygvelzst2RrRUIaQp0nxDWlkL5p6G7bFUDuYUtZj9/80il2g/m0e23sBbQUR6IXBDGMVI0Go5yDZeSV/AgAW6TfaW9ChqTpddwWNVq9602BRMqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ca8a83WMqM6gec3F0fTdKQXgBy7YgtwVk/ARQ7VzTM=;
 b=FVSoKnVlbRFhR33lF78xJtDk8WES3tfTsfOofGzTeC5fsakEgMz8ow9ViOIKsforXGYM0k5DsN7J19eenXxb9IOY3A1inbiPNA2Wbc7TuqVBJQp8LULgJ9cYFKVt+NeYAUKLtB0O7b+yNdbr7wlkIHxoAacb6h8qMH1FyRzXpxr1vrP4oLy4czSrk1aniTsD+fu2+4BlEBlB8sGrXkgpuY9pV1ViVPm/5eKkSfsGdadjeT4Y9lgudwVoqiP/MFCEA/kfW4gWqwg9HBomLWZ54fuYtjzVmiI19iUJ3y8jP4xaBvTNLqf4AO/qWmyvSwfGygTVHfZZ2jzUjchsmHcoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 21:59:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 21:59:51 +0000
Message-ID: <4c89c31e-54ca-45b9-a8ef-081048f2591a@intel.com>
Date: Thu, 20 Nov 2025 22:59:46 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5Bv2=2C1/2=5D_drm/xe=3A_Track_pre-production_workaround?=
 =?UTF-8?Q?_support_=28rev2=29?=
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
 <176367328063.15649.16251382227788014258@a3b018990fe9>
 <20251120211828.GI4063759@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251120211828.GI4063759@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0283.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4728:EE_
X-MS-Office365-Filtering-Correlation-Id: c228409c-0352-4e4b-307f-08de2880212d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGJTMmg0aFF1bzE4ZCtMR3VWaVlXSHBVTk03UmgycGZKcWZ5dVNQS09rdFlD?=
 =?utf-8?B?MklRTy83Y05ZNDMvY2JoTTExS1JzSlU1NDVBUXJnVzEvaTNWOTA2cWJ2cnBp?=
 =?utf-8?B?ak53djVYaDB1Rk5tVGwzNmZRS2UxcDlMNGZMamwzSmVjWXZQNmlKUmU1MTYz?=
 =?utf-8?B?c1FDbDhZcHNaa2FhS0NLWE5HWEJOTmdScWtPWU1WSVFpd2hSbjF2d1Y1VVRk?=
 =?utf-8?B?MnVkUFlLNng1eGNITWVaTXlScUZPMS8vSkFKQ0JPNzVZL0Fzcnp6K2UyZzlZ?=
 =?utf-8?B?WDI2MEdHOHBNSisvdHd0UVhjcmFzZklPcWlGU0pQbWhVSm1lNExtajF1VW82?=
 =?utf-8?B?OXZzanJ5YlFzS2I1cHZSUkZmUXVWQVVrOUFwTGRzUGJpbWpyMDhYL21HR21p?=
 =?utf-8?B?bS9ZQnlLOHRuUXBJR3R3ZENuRm5DeVYzTlgwTE1TTVNxYTdSWWJ6aE1sejhN?=
 =?utf-8?B?S3B1MGYrbmVpRUZGa2ppbm5STGZHSnJWN2FQQm56cXUzT21ac2tFS3FGU1cy?=
 =?utf-8?B?T2gzRE1ydlJ1dEo2YTE4WThUeXlLcEJkMzhjYWcvcWxIWDkxNkl5U0xwVXNW?=
 =?utf-8?B?OFdHMkliMHBtUmRjYjFMV2xiV1paczVjektFY0dOakF1WHErdVdFaGpKM05u?=
 =?utf-8?B?S01UWVRNQnk5WnhFa1RyeVl6QkZ4UXRmWUVZRjc1b2QzNDhmY3BCazJmV3NN?=
 =?utf-8?B?Y015cjNsQ2l3R3lXUlJDeFd5ejVKZFY1YmxMZzRSc0Z4Y1MrU2pwWUEwSkIx?=
 =?utf-8?B?MzNRSzI4cllJem8rQm5KdU1BdWJyZGhEQlpyNDhLNHN0bEszVEU0dmdHNnpN?=
 =?utf-8?B?bUJMdHlRazFTeHZQRG4wdGhQVDhacm5HQ2taUlBBWURsQmI2c1MyNHhweUJQ?=
 =?utf-8?B?ZDhHdUNHMkJNRVVtaG5KdkxqYUVRQ282aHJJWWJvbXd5eWRWM0djd3V2aVRJ?=
 =?utf-8?B?aHJBcWlUd3ppQmdScC9INldWMFdxYzJCZjJtZTVXZ0l2bFdNK0VmVXlwRW1Y?=
 =?utf-8?B?aDU2TVlnejNGemtjQThqZFhaNVp2MlVHWkZQajBocTljeXRJNG5lVDJqUlhB?=
 =?utf-8?B?azV6THFCTlJWMlVibU1ya3JBWE5JZ0txZm85NmxKWnZ4QmdLeDFENFhoTkJh?=
 =?utf-8?B?VU0wMEpuRTBTTDh0a2lDUjRNRWN0dDhxeEYvNk9xcW5ib0dVWk9EdjI2Umc3?=
 =?utf-8?B?YTB5VXlnT2h1bkV2aFdHUk0xMjVDSUxUT3grUXR0SGlJWUNDSXFuVFpmRVIx?=
 =?utf-8?B?UEpVT1JlcExwM2xlbzlxbkpCbnozeHVIY1VIR1MvWHZJdVdkdFBwTzBiTURw?=
 =?utf-8?B?VmhuNzVJaVdLOVlUYTI2ZzVEZitYWEJxNjJTdHNLcGd6VDBrQmVIdTVIRlc4?=
 =?utf-8?B?R0xiUEpEbjQ5dlEwUlRaS25XNlBkMjg4RUY0UmREWjgvWGlMMFVydHBGRzl4?=
 =?utf-8?B?MlhHUS9ZNGowV1FwMHBDSElnbW1teWdkejQ0SVJkSDVzcFZyNjNHVTRhUjc4?=
 =?utf-8?B?R0RVM2JjWEJpWGlLUS9zTEpwa3FaUW1Zb2VjWTBDOStzNGZOSm11eTBHUjRV?=
 =?utf-8?B?bHoybUs1MTdSSHRLcEozUUhFY3kwYjNlTEF2My9xOGc4cndiWHdVWTdnRDZC?=
 =?utf-8?B?amtKZGNIMUZwRTZ1UHNtY0ZPQnhzenlyMjVmam1YUHVqQnJxUmk5WHBNcmp3?=
 =?utf-8?B?a2l5Y3FydWJpNmVXaHc0QUZuVFEwamFBVEhvSlYrUGMyM25xdkE2QkxWcVJi?=
 =?utf-8?B?a3hJRytmZ1lUTWY4bDVVL1BFbDVzMkRXSnpqUW5UYjNLeXFUMngwdzJWVTFx?=
 =?utf-8?B?a1Z1WmpTdzJlUmFhcVdvQUMvSmhqVSszT1JwVG1vMVhOV3VCdVZpUVViclhJ?=
 =?utf-8?B?d2x4RkVIV2FPWUNyYnhPOW5ZZVV4azZVTkxvcVFWNXBUcFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlJoaHM2bnBuV2hOcEV1QmVubWRjcGFSYnltL3NxUnN5S01qSk1hZzRJWmpK?=
 =?utf-8?B?Qk96N0YxZ2czK1UxZ0ExUE00ZnlpUk44K2lndnZxRHdZTHo3T0VON3BTMDJv?=
 =?utf-8?B?UVQ5UGJMNVMxWkVRT1cwUkd4cThiMFRXcFlqOUlwYzk3MjdmQzM0b2pYWUNj?=
 =?utf-8?B?L3NNcEJFRmt2L2hYUnBmcy9OQ05HU3pQMjNaTlpHZnJIUks0Z1g3SkhWKzdV?=
 =?utf-8?B?VCtpdHRHNWh3dGt2cHlHWDZjNlFRT2xTZXVlVC91dTVtUk1rMXdFRENTYVRH?=
 =?utf-8?B?SDc4VTliSmNOTEdETHR3MzlFUWxBY0tVK3FialJDUXh1ckVyancvYkR6cTZ0?=
 =?utf-8?B?TjMwL2xIcHkyUXpCd2JXbzlqSTVGb0dPYllxMTVtQ1lGbVVkZjUybmVMNzcx?=
 =?utf-8?B?YUZGU25aZ2VUamw4eHMvdWF0NVNlMzlPQlF3OUROdWpvM3VvSEFpalgvOHE2?=
 =?utf-8?B?YXhPbFM5ZkI1MkJjaUprazhoWG1XVmw5NVNkVEdWd2g4MEZyT0t2dEdhMUlp?=
 =?utf-8?B?amVaV0wvT2hvUS85UmJ2RWNaOUdhUG9Ya2pzUzUyTjJCaFBEbkdmTFM3c1lF?=
 =?utf-8?B?a1FyYWNBNVc2RHdCemN1SFY2cXRtSzBOcHZOUzBwclE2eWQ1UzVtcFVuL2JZ?=
 =?utf-8?B?MHVVTGZFZ0ZzUEhvcTh3RTR5RDlHaUUyenplVXdQTEIyZWUrcGpiTytZNFJU?=
 =?utf-8?B?WmZxVDVBVVg1dElSMzdobWR3a0ZtQ0h3a2Z1c29KUHFvUzErK2VWQkRKcUZ0?=
 =?utf-8?B?MWZlMHZRV2dud05JUHpJSXJtWXFOK2dTcDNhMHBRSE9MeEErT2JFM0xqcGRl?=
 =?utf-8?B?aXRGWEtETUN6clBETURkRExidThrMGUxeklDbjFpY1V1bE9VcnZrNlkzc3g5?=
 =?utf-8?B?aFdKSmN2N3pYTzhnTkxCKzQ1NGFmSnJaS2pWTmpmVDErWUVCZVJMU0psL3Uv?=
 =?utf-8?B?YzlTbjNWREhSbGc3dnM3dU9ueVRSeENNYXFLd3d1dGlNaTVOaUMzaDUrRmV0?=
 =?utf-8?B?a2ZVRkV4TTlxa0tBRFdFRUxFVko4eUkzRFJVUS9Zd0g4bGVxY01DRGdDVEtM?=
 =?utf-8?B?RDNydFlBMWR0YVdaV3RyQko2VU00ZDZUVWI4dk9HUVlFb0ozMU4rVGx4MzYz?=
 =?utf-8?B?ZXZFSzgzNnpMMFRpam4yMndHeE9Pb2NFZm5WRnpYMmx0YW1pMHF5V2NMYktN?=
 =?utf-8?B?UDZEaS8zWXh0bHI3RGVLcE9mVW5wNUN3SHNXV0d0ZktOcnlGeGNzaDZJQjZm?=
 =?utf-8?B?OGRrMFdyVGtZSWJxNUgxL3lJM1dXdGNaSDllaDlybElaUTJudmtWdjg0bGNE?=
 =?utf-8?B?amVDeDJHUkFwdXR4dHgzY2paZkRtUTNhY2NsS2FiQWFzNVE1R205VUROVEdR?=
 =?utf-8?B?SC90dncyck9vK0EvNkk4clRWUytsS0VMWGs3VHBoNlpPWDdNamdxTitwTUhk?=
 =?utf-8?B?MGJ0ZFlLSzNnYTVtWnlrQ2pHRlRsQzdreDVIK29sYXJvRnVxeEZpL092ODA2?=
 =?utf-8?B?cXN1NS9VMi9aMThrYU5PeTJOd241NitUUzdCTXJtYWM5RTBHOHVJTkI0N0Fv?=
 =?utf-8?B?dE11Mlo2cVpUYTFkaW13TjIvWmhWbHlIc0hhcUFrNTJ1VEFNUi9URDJkTDIx?=
 =?utf-8?B?ZG1GRHg3Tkk2R1g5SDBRdHlENEJuSExaZE9SM2NJUDJ0bzUwcXVib0E1T0Ja?=
 =?utf-8?B?aXFWOXk1Yk5JVVN1NmdxS0tEbFRSVG1hM3FCSFhvQzd6Yk8zSnVyQnROZVNx?=
 =?utf-8?B?U01VQ2Rka2h1cmp1RW5CWHNPazBhblMxNC92Nzg4RHZ6eVNybkQ5WE11V0dz?=
 =?utf-8?B?N3owV3lZNTNQdWxqTG9jOWJNcTRGTGpmUFY2empKdk1rNjBpeEZjTnIvT3Zx?=
 =?utf-8?B?YWpvZy91eWg2ZVF2TWY5bzAxU2t2UlRJS3RaWkJqbXJnS2JLd3JFZExWbXRW?=
 =?utf-8?B?cFJRM21melpIUnRBZWUrc25scEtYMFBqOGRsOE5zN0lOT0V5QXloTUQ2VjRH?=
 =?utf-8?B?eXFtY1cyTit5NzZIajgxZUFkNzd5ckVnaDZVcEFCWGhkVEFLdFJjdVdRT0Ns?=
 =?utf-8?B?ZzdBY21kajAvM1BoNnRackdDcVg1YUs1VjA5eHRuU1E4VHVvSUFFcFF2cGhS?=
 =?utf-8?B?K0lTUmNKYnF3M3p1RUcxMmpOWmtTU3hwNHVXbW4xenJBY0hHUXZ1K01OSHJW?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c228409c-0352-4e4b-307f-08de2880212d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:59:51.3605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2GyVlYybBRyZjPSG9253CU1v9zS3ymyeYnlcY8X/D+5kd6ICrMqTcRTJWjtW6PSiq0x0nLcQFkSzMnCJimVlqAYZlSfCKIuD7y//IXZ30E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4728
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



On 11/20/2025 10:18 PM, Matt Roper wrote:
> On Thu, Nov 20, 2025 at 09:14:40PM +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: series starting with [v2,1/2] drm/xe: Track pre-production workaround support (rev2)
>> URL   : https://patchwork.freedesktop.org/series/157804/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_BAT -> xe-pw-157804v2_BAT
>> ====================================================
>>
>> Summary
>> -------
>>
>>   **FAILURE**
>>
>>   Serious unknown changes coming with xe-pw-157804v2_BAT absolutely need to be
>>   verified manually.
>>   
>>   If you think the reported changes have nothing to do with the changes
>>   introduced in xe-pw-157804v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>   to document this new failure mode, which will reduce false positives in CI.
>>
>>   
>>
>> Participating hosts (13 -> 13)
>> ------------------------------
>>
>>   No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>   Here are the unknown changes that may have been introduced in xe-pw-157804v2_BAT:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>>     - bat-ptl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
>>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
>>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
> Looks like I'll need to add a !sriov check in the next version as well
> since VFs don't have access to this register.
> 
> Michal, we don't have any other means of determining production vs
> pre-production status on a VF, right?

we could try to add 0x9120 register to the runtime_regs, but that would be unofficial hack

so I guess it's easier to assume that VFs will be enabled only on production parts

> 
> 
> Matt
> 
>>     - bat-adlp-7:         [PASS][3] -> [ABORT][4] +1 other test abort
>>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
>>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
>>
>>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
>>     - bat-ptl-2:          [PASS][5] -> [ABORT][6] +1 other test abort
>>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>     - bat-atsm-2:         [PASS][7] -> [ABORT][8] +1 other test abort
>>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>>
>>   * igt@xe_module_load@load:
>>     - bat-adlp-vm:        [PASS][9] -> [ABORT][10]
>>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-adlp-vm/igt@xe_module_load@load.html
>>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-adlp-vm/igt@xe_module_load@load.html
>>     - bat-ptl-vm:         [PASS][11] -> [ABORT][12]
>>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-vm/igt@xe_module_load@load.html
>>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-vm/igt@xe_module_load@load.html
>>
>>   
>> Known issues
>> ------------
>>
>>   Here are the changes found in xe-pw-157804v2_BAT that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Possible fixes ####
>>
>>   * igt@xe_waitfence@reltime:
>>     - bat-dg2-oem2:       [FAIL][13] ([Intel XE#6520]) -> [PASS][14]
>>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>>
>>   
>>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
>>
>>
>> Build changes
>> -------------
>>
>>   * Linux: xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 -> xe-pw-157804v2
>>
>>   IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>   xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7
>>   xe-pw-157804v2: 157804v2
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/index.html
> 

