Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D9FD2F034
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 14:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED4110E58B;
	Tue, 27 Jan 2026 14:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxhhECCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BCF10E57A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769522653; x=1801058653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kSm7F+rhhM1/Vtd+6S+DDG8JqIHLbDdDKK42cfoffpE=;
 b=NxhhECCGUL62IhI25E4IfrTSDx55KRrwTG1NuB1LG+vH+8Ys99MPEL8s
 YKxqq1NBUEBC91ZHd8+PxY1Pdgqzb1iXtm7NxgMZvKVR+0dzfbk50aNwW
 mk7rbubnjFjTalcpt84tFage5eFsGvbI8oKSH+msc0IMgpE1iGsQPWmvP
 15lC2TIpbugZNgD/ATZ8Fp8VkTh8y1J1kjp1grINiduVAq/L1rFIf/WVy
 G0vBgDFRLe0WCY8SudiAIEBD3ARObc1hfuK6JPw2xKUcKl7zzgSfja5nk
 m2yOhG/BHtnc2Qweo1vNBDAR42/BD/DC3mguiZ9Ujrv1y2kg24nZ9cQWM g==;
X-CSE-ConnectionGUID: UF81/pVwQB+0sOuqlGN7RQ==
X-CSE-MsgGUID: pf6NCYUkSnWTFKVZb8kEKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70619478"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70619478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:04:12 -0800
X-CSE-ConnectionGUID: OFwbCvkyTkqvqnBbWbxn1w==
X-CSE-MsgGUID: UircQdm+Q7CGM1q/95Mr9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="212522681"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 06:04:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 06:04:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 06:04:11 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 06:04:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtajvhlmxGC+FeVkc9M8c1kiwJFVCkCyRMg269eTqT19ofpwiSqoTY+nlK+IAt+qMSvM7zXIOUf3m2LNtqX6OLgi3QiOUjDG5KXQHtdF6Ge7As644n1Mv70UvRr2kZdvGpDDEljDRq+KwxVYw6CIqbEr6iu6ihttG2Nsz8friCAuc1xIdarheqkKPIg4zmvYaSdMEszwYnEM1jCi9YHi3DrBGP3ZnNKPFLRMj1xHU1kRwW6+4NEv74yH7gQF+4dsaI64LQ8e713EcIVtNnqG8JG+/9vBj5w8KYGAa9VK+h3VR3tEbFl/LBr/nMQGPP7fr1FAdU4rMAYfiWubmW8C2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEKDzIgjtGrxwfj38GRlluwa2FtquFjysJG6fnvQdkI=;
 b=YIRe+84Z2GNky1NmMFouK7RMM80D7lccx4L8oP0fNgoWEwy/LTruE6t3JC32omeHVpCuws1/UO+ROP+PLIMD2c/TnvoQQjxbs00oLARJB1KwsJmswh6RcrMqzN+dJ6fQ8B5qtMTgE1vjZj4SqgwyMyrV9L5zf261aoBFVfVZPqPNDhua649c2pJ2+JcD9rz0TIL6HgMN2B9OmTfv89u+QkHfu5+lvfEZ4Nbsw0Vvj7pLOMtSUzZbbmxpwwIQ4PZsNHR0Z+RIJiAT/vVJ3x1flk0AUoHYJzSELZjC1rHZsU0HBVk75JU7Y/igmAL2g6qqFXXh/MkNZehF47pOjrRBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 14:04:08 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 14:04:08 +0000
Message-ID: <d0b58cba-c8d5-4c25-865b-47852661d387@intel.com>
Date: Tue, 27 Jan 2026 19:33:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-17-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0129.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa5ce37-7a43-4729-8025-08de5dacf012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVNzM1BJSEl6T3psT0FNSnZWTGdrRXl0TjY4MHZVVURGdkFVOVhoVHZHeTNi?=
 =?utf-8?B?MVZKTGhndUdOM0pyRVNQTnRNUlNXTzhnandxTHpjWXFrZ2cwd0RCZTZHQjV5?=
 =?utf-8?B?SGFnK1Q3Y1hodnN0eURCNmV1b1NTRmZCckd0Zkc3Z0dIREptZ2l0eXAxNE5w?=
 =?utf-8?B?MkRnVXEyUUxXdmU0bnVHSFFJVWs1TzBPQ3FnRzdxQk44Q0JjNDJBYk9wVWNx?=
 =?utf-8?B?ZW1nRXZ2b3BjTHpuaHZHYW9zMHhpMk5jeTd0bHkydXo2bjZ6ZEFrOW0wOHNV?=
 =?utf-8?B?VkthbWw4U0hsSVplWkZmeW9rVGpjbkFRcE1icm42OUtpWHdPV2hlcGNwTEtn?=
 =?utf-8?B?MFNRV2xIaE9xZGsvQmdEZyt1T25seU5qZUt4aWF2VnZtaW1ROFhBNW9DRGZT?=
 =?utf-8?B?YzlwU25ZdTRCaWNiNHR3NllRbFpCTTJWeEp4MlJDRnJQLzdrZG0wZnJORG9T?=
 =?utf-8?B?YXZuVmtoZWIwRUxvVXFqM0R0dXBWUkhwTGdaZnhBSHF6bkQxT2hLSlE5MlFl?=
 =?utf-8?B?WGx4cjgyQldqelZIS0lIYnQwb01ZNzhleElYSUoyTnpENk5IaG9qNXhtcTZS?=
 =?utf-8?B?S21WK0lCenNCNlRKclJteXhMTHYyQkRjUzhnSjN3cHVMNmtPY1dlVG1GQkJw?=
 =?utf-8?B?RnFuUlowNThibFdkcW0xM3FJS0U3WVRCVTY4dHFobXUrK1laY1RwYjhDTSsv?=
 =?utf-8?B?L2lBeEVzcWorQWs4NllGaG5aQUxaZU80Z1FBZk1iR01vRUNVbE0wOGR6K3B1?=
 =?utf-8?B?ZVVmZVRuVUhIakNEeDZaUzJiRm5mMU9lSU5NSUdiTlVXalBManZYUGE2cWxy?=
 =?utf-8?B?bVd1b0plSSs0dWFVYlAvWkpxZHBjSnRncEV6Y0E0b1cvaERpZ29YNlY2cHRS?=
 =?utf-8?B?WG90UHUrVHdnODFJdEJkL1Z0VHlYOHEwZU4rZHJlVzhBazdPV2orR1J2SW9Y?=
 =?utf-8?B?ZVNFTWdDWmh5YjFWN2xTV09qUVlVSXdPK2gwSHJhZDdVWTNzRGJDa2RuT1lI?=
 =?utf-8?B?cENTQ3dBR2lLTzlGMS92dmpHTkJ3UnpKa3RUVFBDeTlBbmhDRHczekVGbU9U?=
 =?utf-8?B?WDFiNEFUWGRTcEtZUTk5NnI0UDdQMFN2TENiUWdaZ0dFM3Y2cjVHRFYwcDdG?=
 =?utf-8?B?OUNKRU9wVmJFSUFNVHNRdWV5c3hmYVljbDl3R3o2NDVWQU5ySGR1Rlk2K0xy?=
 =?utf-8?B?dVlUMzhZNjRUbzV0dUF5RS9UYXQ5UzFkTnBPS0kwREpxOUhvaGVjSm9LaHpR?=
 =?utf-8?B?YzdDTlJXdFRNQ3drclZ2L0VpeDgyWDI2bG1KTC9yeTRSeVpQd2UvNmxmdFhT?=
 =?utf-8?B?UUxBaUhqVVpQSUdoSmZXUGhuemVITUZOWWVKZStjaWNCN0x3N0UwRlA1amdk?=
 =?utf-8?B?R0cvWXRsZU5uV29keVIyaktjVnh5ZHdTWFZleU1iWXlmRklFRFRRdGMraWNx?=
 =?utf-8?B?dDVldy9aVnpGdjRxUzBpUlRiTDNibW9IVGNmeXZFQzNFTHd0NjA1WXArZmNI?=
 =?utf-8?B?dkpGdUU3NVRBdkpab1RKV3d0c0trWEVvaHJ5U01CS2hzbU1uQ24yS0lhL1RV?=
 =?utf-8?B?T29BTEVaenJ5NnREYkR3alc0RDc3Qzk5WFJjeDE4cDBiLzB3Z3ozOHdKSnBO?=
 =?utf-8?B?V3M0VVVzd041c3h6a3pMR0xtaXFrR21Mc2VEK0h1WFdCUFBLbFdXckdCYTFV?=
 =?utf-8?B?b21qdU5RUitWMFkrcERsR0Y1WmpZQTdHODcxYnJ3RHZienZHKzdlaHBoVjda?=
 =?utf-8?B?SGZaUnFmODA2eTY5UG50eExJTTFZTzhJejYrZktkc09XQi8zVERjN09KOU94?=
 =?utf-8?B?RFpxZkZoUUJudTI2RjY1RklsTkJiNk5Vb0JXbWVHb1dJNnlob204dEN1WDY1?=
 =?utf-8?B?M0ZWNGNqOSt4eFNSQ0FEc3gyRWZSdzU2em00dDM4ZFFPREx1RGRTVHdaZjhT?=
 =?utf-8?B?YmhraTBaUGIySXBaaUhabEpXZ3BBY2NtY2FicDVkcGhvYkloMVdWMDVXM285?=
 =?utf-8?B?ZFRTazVBZVpja2JzWGRMYkROMytDNFVtM0ZLYlFqbzl2dHhKNWErMVNyVUsy?=
 =?utf-8?B?SFNoWlprYlZrdWhUcmZZWCtYcklxdEJWVUl6eWt2ZWM3MGpqRDRZTW8ySzZm?=
 =?utf-8?Q?ewcM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUI3NmtIRE1FdkRsT2lrUlFTYlRsM1N6eVZJZ3B0UFREVXRFUnAramJlQ255?=
 =?utf-8?B?L29xTklaem5VdWJNTFlRWTQraktsOG1Ocy9DUllMcG4yazRXendSRkFZWDlI?=
 =?utf-8?B?UFlkdEtsWEcvUTNhMHRrOVJxQmtxcDYzWjB1WFJGNHNQYzgzaDF4emRCTkh0?=
 =?utf-8?B?bW5wY0Rac3VxUkhjWDcwblUvZEF5TnBMdEk3eXdWM1daNkI4Tjh1dTR2b2FJ?=
 =?utf-8?B?WS9ZdmU1SmY4a0RPeEliNjhnOFJPNDQyWlJMaUtTaGNuZ1VwQkZOUjkyZm9y?=
 =?utf-8?B?Q0pkY3J6VVFXbVNQZm4xVWtxYzkvQ3RKQ2t1aGF1MkJrVEVEUmMrZ0VHN1BI?=
 =?utf-8?B?QnprZkVmNm5tVmU0MEFPT0lubUtmZHVDeFR5OXdLL1B6QVNBQ0Fwc2tTeXZI?=
 =?utf-8?B?WUNJRHczQmlLVHFLNUpmQnVldzVKU3NXcUxRQWtWcys1UWhyZEZCK0FkWU8y?=
 =?utf-8?B?Y1NtTjN1ZTVURVN6bXFwaTZVODNCbDNGOVFneWdzMGdMTWFSNUJUM0JYa2o0?=
 =?utf-8?B?ZE9tKzNFVWQ0YVAvS2lVcUxVblRIcThsd2FTSGJqN1owQm5WdTE5bUcyc0hk?=
 =?utf-8?B?TnZ0Tk95Q2dTSmlmSm9nQ3lLQUx6WG9lQTZCNmxUbUYyTS9ZRDlYeU5xQWZW?=
 =?utf-8?B?TmxwUkVYWlNJVWhveFJ2ZnFtcEhoMWVSeEhsRVdJc1B5TkRKS2hrTTRZUWZp?=
 =?utf-8?B?blZEYlVWUTBza1lMWW4vMVRYdmVRbkFpZU53Y2FIR3FmWTBvUzJXclVtVFQ5?=
 =?utf-8?B?TzhZSWM1dVZJRTV3NytRWHZ4U1lNaDZoM0lhb3RpZUdNNTJvVWZ0WENnV0xB?=
 =?utf-8?B?MGZjQjRVMDg5NE5Sc1BCdUIvZnVhUEIzazhFYjVTemRobEVzWWJhS25GZExV?=
 =?utf-8?B?emhzS0MrcGI5cm9YUHdFSDU2R0ZmRXNIYWQ1Y2N1eEIvOWVnaVExM0JTaTA1?=
 =?utf-8?B?dldhaUFkSS82ak9hTm9XbXBRaDBMd3dMcVRnMUtVWnpYQjFYYjlKdHB0Qk4z?=
 =?utf-8?B?Tjg1blkxS2tnWTd5SXEzd2o5Z2xnb2tiK3Rxdkw0SVBGcG4rbHRRVmN2WTdh?=
 =?utf-8?B?eExqcW1Edk1HK1UzZVRaUVNBdmZlaDdFazVPbHlPZ0Y0US9lVjQ3d3FFdU50?=
 =?utf-8?B?VlViUlBRN1hnRllMU0o3WlRtKzdDSG1YRFZiRGpNMjlocitNLzVCRzFNMVJL?=
 =?utf-8?B?cGlpOEhBbFM4WnZhb0NyNmtNUVFKdjZNUmdlZWs3T0NFSnRhTDA3MGVaaXlv?=
 =?utf-8?B?WUdBUXRNWnVEWWxaU3JOaWpJWWdMU0I2eXh6VW9rRk01THdwaFlzNHZzOUdW?=
 =?utf-8?B?S0o0SGNlWjBzMG1vcWc4a3JHQUY0ckt0WDZpY21PeWhaSGN4cUxSdzA1VGZ2?=
 =?utf-8?B?WEJmZFBuRUw3TldvenNvejFKTE5Hd0xCaWF3MW0xd3g1aEdxWGFZcGl2WXYx?=
 =?utf-8?B?bm1BRnRESlgvaEhoYkRNV3hnZ3RwZGZXSllUdk1saml2QmxvK1RJYWo2dnVs?=
 =?utf-8?B?T1dDaG5EMG9BTmNuTUtnNTNwYmRYMVlUWEhPRTJiRXhEVFdudlRpbU1LK1FY?=
 =?utf-8?B?bEFNWGhPK0svZ0pBS3RYN2VRNnErd0xReDE1TjFHMU9DdUVJb2ZnT1NHL3dF?=
 =?utf-8?B?eDBjSUNFM1pvRzczNm0vK3lGWHpTRWlHTU41ZWVlWUJoZWMzb0NWOEFhVTFh?=
 =?utf-8?B?aHgrTmJwSDFHUk0vUDlpVUNoSFFOdXF5Z3dycytKWkwvVTdUV014T2U0VmJm?=
 =?utf-8?B?TGlsV25uQW4xYllJZXFWdVFESkltM3ZZa1d3QjJyTFBQNHFMdTRDS1ZyUGtB?=
 =?utf-8?B?d1hwc3lUZkVnbzlULzEvK0JFVitWWlZmYytUNmdqd2NCcXBBdjNzaWE1TDNl?=
 =?utf-8?B?K2VXanFjVGk0RTdOMjVBekxXWEY4L3VnSUw3c2V1dlM0U0FFMlk2RjErdm9R?=
 =?utf-8?B?RGVJYW0veXkyUHJMSkhTRkloRnB0L2swMHc4R3ZydEs1R1MrQlF1c2t0ek1k?=
 =?utf-8?B?TDFoQ2JFaERteThZZnZpRlJwMHdEUEt0V3FmY3pGN2RhYVlsbUcvNkhpK09H?=
 =?utf-8?B?YnJ5OVNzL3lybUU5ekZnTnFLS2x6VnBFRGhGRU1TNHJCTDYvZnBSRjRFaENk?=
 =?utf-8?B?N3Jud0VUeFNZSmp5V3BWalNnU2hoaXkzS2RRU0FJTmFCSHhtdzd3Ulc0aFdr?=
 =?utf-8?B?MDNZc0JlbmE4OVFIQ0RDcUdwd3dkZXV4c2gxSGtoQUFXeGV6LzhqQnl4WFFH?=
 =?utf-8?B?YVA5ZC9HckRaQzFOVk1MTlJFSUYvTkRiaTNGSmhGYzJuMHlmTUIza2E3REJy?=
 =?utf-8?B?SGIyWHdqTGV4QVZPUVdmV2hyaytwMkpySHphaUY0Wkp6ODd3VFRILzl4ZEJP?=
 =?utf-8?Q?Cvyb7rbfREPc5wFY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa5ce37-7a43-4729-8025-08de5dacf012
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:04:08.1138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaZZgNv044iHhaDswP2N/4yz0SDKkQyGJiBz7VAaS5YBedj7IhsFyCFgG70uSW9SdISRrujP/CMDKln2EvW4QU0102+9sRO7CJs/28Qs0HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
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


On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Uncorrectable Core-Compute errors are classified into Global and Local
> errors.
>
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>
> A Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without distrupting the rest of the device.
>
> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> generated and GuC is notified of the error. The KMD then sets
> the context as non-runnable and initiates an engine reset.
> (TODO: GuC <->KMD communication for the error).
> Since the error is contained and recovered, PCI error handling
> callback returns PCI_ERS_RESULT_RECOVERED.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_ras.h |   3 +
>   2 files changed, 110 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ace08d8d8d46..2a98cb116dc7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -2,11 +2,16 @@
>   /*
>    * Copyright © 2026 Intel Corporation
>    */
> -#include <linux/pci.h>
> -
>   #include "xe_assert.h"
>   #include "xe_device_types.h"
> +#include "xe_printk.h"
>   #include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
> +#define GLOBAL_UNCORR_ERROR			2
>   
>   /* Severity classification of detected errors */
>   enum xe_ras_severity {
> @@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>   	return xe_ras_components[comp];
>   }
>   
> +static void log_ras_error(struct xe_device *xe, struct xe_ras_error_class *error_class)
> +{
> +	struct xe_ras_error_common common_info = error_class->common;
> +	struct xe_ras_error_product product_info = error_class->product;
> +	u8 tile = product_info.unit.tile;
> +	u32 instance = product_info.unit.instance;
> +	u32 cause = product_info.error_cause.cause;
> +
> +	xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected Cause: 0x%x",
> +	       tile, instance, severity_to_str(xe, common_info.severity),
> +	       comp_to_str(xe, common_info.component), cause);

Please fix formatting issue (Tile %u, new line at the end of message) 
and include timestamp in log message.

> +}
> +
> +static pci_ers_result_t handle_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
> +	u8 uncorr_type;
> +
> +	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
> +	log_ras_error(xe, &arr->error_class);
> +
> +	xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu Uncorrected error type %u\n",
> +	       arr->timestamp, uncorr_type);
> +
> +	/* Request a RESET if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return PCI_ERS_RESULT_NEED_RESET;
> +
> +	/* Local errors are recovered using a engine reset */
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +/**
> + * xe_ras_process_errors - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery needed,
> + * PCI_ERS_RESULT_NEED_RESET otherwise.
> + */
> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
> +	struct xe_ras_get_error_response response;
> +	u32 req_hdr;
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return PCI_ERS_RESULT_NEED_RESET;
> +
> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_SOC_ERROR);
> +
> +	msg_hdr.data = req_hdr;
> +	command.header = msg_hdr;
> +	command.data_out = &response;
> +	command.data_out_len = sizeof(response);
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		rlen = 0;
> +
> +		ret = xe_sysctrl_send_command(xe, &command, &rlen);
> +		if (ret || !rlen) {
> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");
> +			goto err;
> +		}
> +
> +		for (int i = 0; i < response.num_errors; i++) {
> +			struct xe_ras_error_array arr = response.error_arr[i];
> +			struct xe_ras_error_class error_class;
> +			u8 component;
> +
> +			error_class = arr.error_class;
> +			component = error_class.common.component;
> +
> +			if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
> +				ret = handle_compute_errors(xe, &arr);
> +				if (ret == PCI_ERS_RESULT_NEED_RESET)
> +					goto err;
> +			}

Need to handle non-compute errors.

Thanks

-/Mallesh


> +		}
> +
> +	} while (response.additional_errors);
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +
> +err:
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
>   #ifdef CONFIG_PCIEAER
>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 14cb973603e7..28400613c9a9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,8 +6,11 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include <linux/pci.h>
> +
>   struct xe_device;
>   
>   void xe_ras_init(struct xe_device *xe);
> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
>   
>   #endif
