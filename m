Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20238C5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C817210E14D;
	Tue, 25 Aug 2026 07:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RmL/SCS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C73010E14D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 07:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787642545; x=1819178545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EV9BGO4sG9qVjsgMB1Dh4bsTSLiNtJU/NbiEC7LM38E=;
 b=RmL/SCS47BnsSpWUyT34tJ0rlQQ6SojcwXDPSf6Jw/dCAKBlDLd1Nk0L
 XpvAkAGSxOLytzbR6keh6y/5KB9HrSp+4FgOW2VCdW4U8C6aWW0yCsLq/
 ttCEEnhA8feW7JDYquRI3WFTU8VaE6Ar6nbYZp2tsibVAi+YF4/QvqQS5
 LcQp0xNzXTlgdX0bKKLThpckC7eqIfUXtwIg+wYx9I3yYtrVKKfOlcuZ4
 wtHoTiIgNJr8ku7l0p9DGKQZkEI2Xs8c0G0l3qTDPj3qt31UnSWxtzkrG
 5TPu4YkbcFfKo/NN9HxCB7nhRy9UT5qrya41uM6rkcPWBn9pveTuGQOzZ w==;
X-CSE-ConnectionGUID: VH6ACB+JQDusNu6iUwBfhQ==
X-CSE-MsgGUID: ++ti0UNSREGQ7FG3j9r6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88024848"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208,217";a="88024848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:22:25 -0700
X-CSE-ConnectionGUID: BDhhaSfQSJqbj0+5aMM0Gg==
X-CSE-MsgGUID: BCn5kmUVSWqUDlE6uspQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
 d="scan'208,217";a="261074085"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:22:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:22:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 00:22:24 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 00:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9CzJlKU0jChOKy2hBhUtxM1YP1C5x/2wYdbNJ1Qo6K7eFfRXxvQo9fHBBSAjq9pkhTfgwX6+if/e6qztlpYIdKCnUpVMLdZ+qT2kHgXBQyXx8GBce+YvmOamIzludvLfn87KYWO+/pNYF/Krk/2mUUv5rdJ7demouhj3v+qyyvhXrpKMDVZtICom8RloSI2ZsrizECfANZIeIrWdYv8+y6r2pGTLe8dyUW63QlEbaUkM3G/lAWNg5EPedU89mjumbkn93OPQ6s49Sxm0FpTGiWxd7Kk88g6WtIWIJkJm/s6BhZUOKBizhtPWdIHxa4OU+dmOw1T6Fj/HqYzERJJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jsze6rElg0L3fQm/9yd6gzsS+S/8yW4FoLn89fVyZc=;
 b=hj+KItlWIUyuDQUHb8MRnVe0cBDi527xP7e8/HdlyLeq9ri3f4B9l1tThjWAmh8Y68EXjU36R7pmmT5cOaC5hveo/aTogYdO5vf8KsBBZCwiYuVdQlo0o89ystzFxY7rqdQnvKyp2kgJSBizlWc7q+X2Sx+Qmwml83nqf9Q7YV5r01AeZFe77IuqMA0EzTw3Q5MzH4YrmpFjX44vcLDcPlKwics6qIkgNdcKNme9CcDWsTGj7XmK4lu5h0I0Z6tawm6nKmZFw64SBi2RNu7SDqxtzAOnXKrhC/AP596MdTr5NU+yxPhh6wkqqR/h4RK6e1BZPmoqdCytjJ3ZmNchAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY8PR11MB6892.namprd11.prod.outlook.com (2603:10b6:930:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 07:22:22 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 07:22:22 +0000
Content-Type: multipart/alternative;
 boundary="------------LJHC9kPdUckQN03V5ye0MW23"
Message-ID: <a533acaa-0f43-4cd0-abec-034b37b057d5@intel.com>
Date: Tue, 25 Aug 2026 12:52:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from
 thermal config on CRI
To: <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
 <20260824184137.2164727-3-karthik.poosa@intel.com>
 <20260824185755.1B68F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20260824185755.1B68F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA5PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::7) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY8PR11MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 8291b9fe-b653-4c57-3f86-08df02799ad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|11063799006|56012099006|13003099007|8096899003|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: x7Vf83jh17BD/b6sm6AoRGL2bFC+OgtsSbLH1reL1Q5ebODBCUx9j0HNnLQ5kB9OJnTbbYjnV4L84GLYTz5xkO/MPbDcNORJeB0+Qx9JWEOPRL7+9PjfUCTjx+JH+z1fYyrUQdqfos5gXEGf+YutLTlDJNYTU0qovmxtzDGLrswVHyMa9QiYoA2xbDDeHbZxxkljJC9uXAZt3r1EpM6P78DkSj6C2cnLl6sD2X2WISbMLvrXsW6FXS7B98NtllX1+Zp7bRZFxWjPmUGp+v3nNSJLK9oNYiFtecYkKa4c6Tdn3mjCsigOQHiNwXm5lGHbUBeWOMuS8hSf24qi7XcwZZ8Xng6vGg/9rcAw3MozMyA049UHscr2sKy8NhBYGL7qgl+o1Tg8MbRzUzL+SwDBrEMNg3vxMx/9E56d1MBy/4sM0wbX1jrOzl1Ujul2ljgOW/qFQ/34/BBjo+jRyMN6z4Vf48gnVFy8frSg4j6qFevCiJ3DgKWaFQSKJ3QEKfiAraYa+zWmvpVsMP/LafaQsSp+bWTbQUThKAgv0SAaUan3bF5Eo1izitdV51sofPAG0OBFvimsdL7Qeg0FeZ4R3LOzKw/6t8Qp0Q59kjXLqQmq18XO054+h/5ax8cCIZUc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(13003099007)(8096899003)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R204dXNxTUVXVkhuNVkzK3lMMUFOUnh6Um92YVNNVkp5Y0U4YjNQZHZRUFV0?=
 =?utf-8?B?QWphZTA3cUswYm8wMTF6MzNjYW1vdDJ6SkZWT3dpZnBMWk9XWm4xUlZ6bFAy?=
 =?utf-8?B?SnBWaTkzeHFWZXN5azJ5Ri94Q2VJUEhTQlJzTERROTBnUHhqaE5HdU1pOEZa?=
 =?utf-8?B?KzRTbTZpUDhxQXU5RHhWYUZuMnZuUXREZFFIM3llNFpBRXFTUjRwZmo3L3Nw?=
 =?utf-8?B?b2l5Q1FaVWhsS3FNOExUb1JKN1ZVclJRSVZiSW5zajRVdFlqeTlMUnJBR0tn?=
 =?utf-8?B?bUJVNHErWXlKTVJ0N2tWNW4vWDhCb3Zud0tKWENNYndkRklzVUhDT0FXWWNQ?=
 =?utf-8?B?WVZEbHUweVhMRmg2SmxIMGtMTy9KM1NSTWMxSHM1VTB4SE15MDB5Tnp2VEp6?=
 =?utf-8?B?N25pSzcrdk0yMklmVXBzOHdySTFYbzJuRFBMZEF1VDZvOTZyMDc3Vmg5MWlZ?=
 =?utf-8?B?ZDVQWEpkcXdIci9xVzBDZmhkUUYramg3NlZ3bENoOHF4R2xKbFdsYTZKRjNp?=
 =?utf-8?B?dCs3UDMrUHZJMm9NQzJTR1oyUVd0MFVReVNOMlltcHc3NEJ1dkp6dFNyckdD?=
 =?utf-8?B?aTN1TTQ3enBjTHU2RmV1aS9meG5pNXpSSFcxMXI1Yk1JeEc5NGF0RlR2V2ta?=
 =?utf-8?B?OUZKVFdVbnVXQ3RmSTJoRkVDYzhldnpMZ3VPOVFGTW81YU1vOHRjRjVSVElN?=
 =?utf-8?B?cjZSbnJjSGE5aGExUUdwSVVmbU9zbWYxU0dxSExHaG1BUE1iSWFGQnhFbnF5?=
 =?utf-8?B?L0ZxeTMwQjRQNzlBcVNxT3N1Ty9UMVNSUk1wcDBOdzVCNnBFN05BU2FLYUhD?=
 =?utf-8?B?U1I4am5LSzdrelcxSTkyUVJiWG5zaFNVNVRsN3pBZk9zV2tidnRZREFkZ0R4?=
 =?utf-8?B?OFZMMldicEVac3Q3MDRVZzJtU1V2MGVpV3RjUWM4R3ZLaFVCVG9PeERZenZN?=
 =?utf-8?B?R3N1RkxNelNZWFNYZDYzTzArQ25OelhrYmxGRnZ4SmxQT2hFVDZ1cnZqU2du?=
 =?utf-8?B?ZTl2eGY2Nk4waUYrdmNFYStCemhMK0NucXNtMVV1ckZxMlVyYldzQ0Jobm1N?=
 =?utf-8?B?Z2FvWVhqbXJuVHhNbkVTOG1NS3hWaWZ0ZVZCdHplWnlRS2IxZHAzQ2dIb21I?=
 =?utf-8?B?YVEvU3VmeDMrTzcxOG1RN2NuanQ3cUJuTHFKTEhyZjRTQjRBZ1NwL1JYckli?=
 =?utf-8?B?YUVnbWJHSnZWQysvR3RTTjdtVGc2cFl5WHVsYXpWSWo0LzVvVlFmd2REUG1s?=
 =?utf-8?B?UnhEUjRHYjdKemtoRGtnR3RseTlLWVJlOXRBaXFrMEpKUEllVzN5VlYxUFBB?=
 =?utf-8?B?SGxLeTJ5NHJOSklJVi9wOWdrRUtRdDdxdDdEV3gzbmFObFVuYVpEVjVLbWNP?=
 =?utf-8?B?UDd5T2JqcGhGMVZCd0dvV2ZGKzdqVkxQaWxIWEhiczhBNURXL2xqV213ekVT?=
 =?utf-8?B?VGRwZEtuR3E4WWZjUFhTQ0kza3BRSU12SWdLZnQ3RmRZUTFuaGNrMDIyQmJ6?=
 =?utf-8?B?MHNUY3YzVGtEY0lxREh2ZVM5eHlqUERab1JxN0JwcGdhRzd3akQ0TTZ3SUJR?=
 =?utf-8?B?dDNmNmtUVnV3SjYyZVIzTzhVRFhYNmhTR2h4VGduQ29VZjdtQmhld01Mbmlm?=
 =?utf-8?B?SC92VFlVcjlDeHp4N1kva01WcFBsOGdiejd6UTlwalBpZXlCR2o3a0xreUpZ?=
 =?utf-8?B?TUxsa1hEOEIzZGgyaTQ4N3BrWXNQVXlYOWNncDVDUXpFcGREYlhPYXAySmlj?=
 =?utf-8?B?amd3MGg5WUdhTUZMMDgvbTdUYmFlQUJmdm8raWZqamNMRndaVjhxTnZ2REU4?=
 =?utf-8?B?bzVjdUpvSUsySlFzZ1k3UmU3ZEQ0bllqZWV4elRrdXBRSktDNitqS3pCcERQ?=
 =?utf-8?B?dS9oN2hSSkxobCs3Z2g2NmFsbks2QXJ1OHAyUkFBa09kQzFOelhhVlhFMTNm?=
 =?utf-8?B?MmFzc2hkc0JrZEQ3NStmWW1JbXdwZ3ZVWkk4VDBTV1BISGh2WG5Ya1l6RlBH?=
 =?utf-8?B?Q3FBYzBUS3hRVStudVNLWC93ZjNUMzREUjNhWWVON2FrdzZHYklwK1JGVDhz?=
 =?utf-8?B?MW9laVNuNFBqako5WlhyVTNjYXVudHhEUEkzQTl2NXl0eUh4eDh0a2Mvano5?=
 =?utf-8?B?eHFObVdyTmZtdWQ4YkZoVCt2WlAvazFhWGNVV09xSFFsMDlyb2FiWnZhNWtB?=
 =?utf-8?B?TEIyRjFoektmNmhreHMxTElHblpuVmdhRDJvR09uTk5XUjlKVUV2a2xqSXhl?=
 =?utf-8?B?MXZaNmNnQlFxRURjeUFuQS9NT1BUVzgyN3JMbUl6UHFzSElkL1Q5c0I0UGw4?=
 =?utf-8?B?RVNWQzhNa00wdDZVUitiSFNnQXgxWnZiOHpoTzFtZWRsNWdnWEtTZz09?=
X-Exchange-RoutingPolicyChecked: PmYfBcUXAhOO1fN2O6ICrvUtXEDEvoxgBFDNfdYSPIUJGW1jut4iWpppHWgzk4lDNkD9gYp6Of/uPaV4WQrN3aYGc2vEfDHSURKHKeF8TnkhbdVUhFTc4Ns0Fjlh9fJffpV0GgMvmczH1h1RE7dJD+vqcpKLrszFL/S6+dcXKPWf+31ZaN+bydX8LOWLj1C00LuliBWZIKczKG8wNhUm//fQh9E/MfoSz/hLqSeI6TKBpehZ0+F8BwvywE63v1p1s0zenC3S613OyCRjGkUTjspK9IGU+pOpCP7NsMQUn4RZyuMYeRkCvy8C4jaSLoUPE4ZQ0EPmosUXOrdvJiq4/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8291b9fe-b653-4c57-3f86-08df02799ad9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:22:22.3338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBAEbJkuZOnB2+NJOYibEe8nbyuxs1XkMI/iA4mtA6cPLn0n86b7Q2F7+AqFDjGfvDp0zBPnbyG46Q1wrcElcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6892
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

--------------LJHC9kPdUckQN03V5ye0MW23
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 25-08-2026 00:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>
> New issues:
> - [High] VRAM temperature sensors are silently lost on platforms where the thermal mailbox read fails or is unsupported.
> - [High] The dynamic VRAM temperature sensor count feature for CRI is completely non-functional due to missing static attribute definitions and register mappings.
>
> Pre-existing issues:
> - [Medium] The hardware monitoring device is registered directly from the DRM subsystem rather than using an auxiliary device driver.
> --
>
> --- Patch [2]: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on CRI ---
> commit ef0f46c26d79ec5ef4b877579a9d69bdbc93ae6c
> Author: Karthik Poosa<karthik.poosa@intel.com>
> Subject: drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on CRI
>
> This patch reads the number of VRAM temperature sensor channels from the
> second byte of READ_THERMAL_CONFIG on CRI platforms. It uses this reported
> count to cap the exposed hwmon attributes for VRAM temperature sensors,
> while retaining the maximum supported channel count for non-CRI platforms.
>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index c15312b0858ca..8c8a519711230 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> [ ... ]
>
>> @@ -786,6 +790,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>>   	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>>   	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>>   
>> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
>> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
>> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS && hwmon->temp.vram_count) {
>> +			drm_warn(&hwmon->xe->drm, "VRAM channel count %d exceeds max %d, clamping\n",
>> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
>> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
>> +		}
> [Severity: High]
> Can the extra sensors on CRI platforms actually be exposed to sysfs?
>
> The HWMON_CHANNEL_INFO(temp, ...) static attribute array doesn't appear
> to be expanded in this patch. Since the static array caps the maximum
> channels visible to sysfs, won't the hwmon core stop querying early
> regardless of the dynamic vram_count value?
Yes, HWMON_CHANNEL_INFO() needs to be increased to accommodate the new 
VRAM channels of CRI.
>
> Also, looking at xe_hwmon_get_reg(), there doesn't seem to be a branch
> for XE_CRESCENTISLAND under the REG_TEMP case. Will is_vram_ch_available()
> receive an invalid register and fail for all VRAM sensors on CRI?
XE_CRESENTISLAND check is there in xe_hwmon_get_reg(), see 
https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_hwmon.c?ref_type=heads#L269
CRI and BMG share same offsets
>
>> +	} else {
>> +		hwmon->temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */
>> +	}
>> +
>>   	return ret;
>>   }
> [Severity: High]
> If xe_pcode_read() fails earlier in xe_hwmon_pcode_read_thermal_info(), the
> function returns early. Does this leave hwmon->temp.vram_count uninitialized
> at 0 instead of setting the fallback value of 16?
we shall initialize hwmon->temp.vram_count to 16 before pcode operations 
for this.
>
>> @@ -964,6 +979,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
>>   	u32 reg_val;
>>   	u8 temp;
>>   
>> +	if (vram_id >= hwmon->temp.vram_count)
>> +		return false;
>> +
> [Severity: High]
> If vram_count was left at 0 due to an early return during the pcode read,
> this bounds check will unconditionally return false.
>
> Does this mean a transient pcode error permanently disables all VRAM
> temperature monitoring on older platforms, whereas previously the channels
> were still exposed?
>
> [ ... ]
> same as above
>> @@ -1621,6 +1639,13 @@ int xe_hwmon_register(struct xe_device *xe)
>>   
>>   	xe_hwmon_get_preregistration_info(hwmon);
>>   
>> +	hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
>> +					      MAX_LABEL_SIZE, GFP_KERNEL);
>> +	if (!hwmon->temp.vram_label) {
>> +		xe->hwmon = NULL;
>> +		return -ENOMEM;
>> +	}
>> +
>>   	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>   
>>   	/*  hwmon_dev points to device hwmon<i> */
> [Severity: Medium]
> This is a pre-existing issue, but should this hardware monitoring device be
> registered using an auxiliary device driver?
>
> The hwmon subsystem documentation dictates that if the main functionality of
> a chip is not hardware monitoring (such as a DRM controller), its hardware
> monitoring functionality should be implemented as an auxiliary device driver
> in drivers/hwmon/, rather than being registered directly from the DRM
> subsystem.
This is a pre-existing design choice in the Xe driver.
The hwmon device is currently registered directly from the DRM driver,
similar to several other GPU drivers exposing thermal and power 
telemetry through hwmon.

While the hwmon documentation recommends using a separate hwmon driver 
when hardware monitoring is not the primary function of the device,
migrating the existing Xe hwmon implementation to an auxiliary device 
would be a larger architectural change and is outside the scope of this 
series.
This patch set only adds CRI-specific thermal sensor handling on top of 
the existing hwmon infrastructure.


--------------LJHC9kPdUckQN03V5ye0MW23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-08-2026 00:27,
      <a class="moz-txt-link-abbreviated" href="mailto:sashiko-bot@kernel.org">sashiko-bot@kernel.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260824185755.1B68F1F000E9@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:

New issues:
- [High] VRAM temperature sensors are silently lost on platforms where the thermal mailbox read fails or is unsupported.
- [High] The dynamic VRAM temperature sensor count feature for CRI is completely non-functional due to missing static attribute definitions and register mappings.

Pre-existing issues:
- [Medium] The hardware monitoring device is registered directly from the DRM subsystem rather than using an auxiliary device driver.
--

--- Patch [2]: [PATCH 2/3] drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on CRI ---
commit ef0f46c26d79ec5ef4b877579a9d69bdbc93ae6c
Author: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Subject: drm/xe/hwmon: Use VRAM temperature sensor count from thermal config on CRI

This patch reads the number of VRAM temperature sensor channels from the
second byte of READ_THERMAL_CONFIG on CRI platforms. It uses this reported
count to cap the exposed hwmon attributes for VRAM temperature sensors,
while retaining the maximum supported channel count for non-CRI platforms.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c15312b0858ca..8c8a519711230 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[ ... ]

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -786,6 +790,17 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;thermal config count 0x%x\n&quot;, config);
 	hwmon-&gt;temp.count = REG_FIELD_GET(TEMP_MASK, config);
 
+	if (hwmon-&gt;xe-&gt;info.platform &gt;= XE_CRESCENTISLAND) {
+		hwmon-&gt;temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
+		if (hwmon-&gt;temp.vram_count &gt; MAX_VRAM_CHANNELS &amp;&amp; hwmon-&gt;temp.vram_count) {
+			drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;VRAM channel count %d exceeds max %d, clamping\n&quot;,
+				 hwmon-&gt;temp.vram_count, MAX_VRAM_CHANNELS);
+			hwmon-&gt;temp.vram_count = MAX_VRAM_CHANNELS;
+		}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: High]
Can the extra sensors on CRI platforms actually be exposed to sysfs?

The HWMON_CHANNEL_INFO(temp, ...) static attribute array doesn't appear
to be expanded in this patch. Since the static array caps the maximum
channels visible to sysfs, won't the hwmon core stop querying early
regardless of the dynamic vram_count value?</pre>
    </blockquote>
    Yes,&nbsp;<span style="white-space: pre-wrap">HWMON_CHANNEL_INFO</span>()
    needs to be increased to accommodate the new VRAM channels of CRI.
    <blockquote type="cite" cite="mid:20260824185755.1B68F1F000E9@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">

Also, looking at xe_hwmon_get_reg(), there doesn't seem to be a branch 
for XE_CRESCENTISLAND under the REG_TEMP case. Will is_vram_ch_available()
receive an invalid register and fail for all VRAM sensors on CRI?</pre>
    </blockquote>
    XE_CRESENTISLAND check is there in xe_hwmon_get_reg(), see
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_hwmon.c?ref_type=heads#L269">https://gitlab.freedesktop.org/drm/tip/-/blob/drm-tip/drivers/gpu/drm/xe/xe_hwmon.c?ref_type=heads#L269</a><br>
    CRI and BMG share same offsets
    <blockquote type="cite" cite="mid:20260824185755.1B68F1F000E9@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	} else {
+		hwmon-&gt;temp.vram_count = 16; /* For older platforms, max is 16 VRAM channels */
+	}
+
 	return ret;
 }
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: High]
If xe_pcode_read() fails earlier in xe_hwmon_pcode_read_thermal_info(), the
function returns early. Does this leave hwmon-&gt;temp.vram_count uninitialized 
at 0 instead of setting the fallback value of 16?</pre>
    </blockquote>
    we shall initialize&nbsp;<span style="white-space: pre-wrap">hwmon-&gt;temp.vram_count</span>&nbsp;to
    16 before pcode operations for this.
    <blockquote type="cite" cite="mid:20260824185755.1B68F1F000E9@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -964,6 +979,9 @@ static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
 	u32 reg_val;
 	u8 temp;
 
+	if (vram_id &gt;= hwmon-&gt;temp.vram_count)
+		return false;
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: High]
If vram_count was left at 0 due to an early return during the pcode read,
this bounds check will unconditionally return false. 

Does this mean a transient pcode error permanently disables all VRAM
temperature monitoring on older platforms, whereas previously the channels
were still exposed?

[ ... ]
same as above
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -1621,6 +1639,13 @@ int xe_hwmon_register(struct xe_device *xe)
 
 	xe_hwmon_get_preregistration_info(hwmon);
 
+	hwmon-&gt;temp.vram_label = devm_kcalloc(dev, hwmon-&gt;temp.vram_count,
+					      MAX_LABEL_SIZE, GFP_KERNEL);
+	if (!hwmon-&gt;temp.vram_label) {
+		xe-&gt;hwmon = NULL;
+		return -ENOMEM;
+	}
+
 	drm_dbg(&amp;xe-&gt;drm, &quot;Register xe hwmon interface\n&quot;);
 
 	/*  hwmon_dev points to device hwmon&lt;i&gt; */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[Severity: Medium]
This is a pre-existing issue, but should this hardware monitoring device be
registered using an auxiliary device driver?

The hwmon subsystem documentation dictates that if the main functionality of
a chip is not hardware monitoring (such as a DRM controller), its hardware
monitoring functionality should be implemented as an auxiliary device driver
in drivers/hwmon/, rather than being registered directly from the DRM
subsystem.
</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
      is a pre-existing design choice in the Xe driver.&nbsp;</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">The
      hwmon device is currently registered directly from the DRM
      driver,&nbsp;</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">similar
      to several other GPU drivers exposing thermal and power telemetry
      through hwmon.</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px"><br>
    </div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">While
        the hwmon documentation recommends using a separate hwmon driver
        when hardware monitoring is not the primary function of the
        device,&nbsp;</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">migrating
        the existing Xe hwmon implementation to an auxiliary device
        would be a larger architectural change and is outside the scope
        of this series.&nbsp;</div>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">This
        patch set only adds CRI-specific thermal sensor handling on top
        of the existing hwmon infrastructure.</div>
      <br>
    </div>
    <br>
    <blockquote type="cite" cite="mid:20260824185755.1B68F1F000E9@smtp.kernel.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------LJHC9kPdUckQN03V5ye0MW23--
