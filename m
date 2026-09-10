Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1033C88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8670A10E210;
	Thu, 10 Sep 2026 14:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOCXO39A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27A10E2D2
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789051278; x=1820587278;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hGvikhaeoQeqWqmbEO7bJsIVve5Im3dPguJT/7GMx/0=;
 b=VOCXO39AGHE0LuRm4+UKfX8aCIJITNJmA+HgJiF9fm6jESqlCQfXQ38/
 b+gvNR1xmQ/v+FdQpoWIsExQ7yzSGfA3VWwPGutc7kxBXRPyWLEa3J0Ax
 X4j2wpWzAMmFGjyOFglxUpcII2mM3JvEbQfUJUoznS6NZV3i7ZKlm4X6S
 FSWJwpOOoqaRQt2KXhtZd9floJQx4Uf8n07IPQ8UhtY3X/ud5mA44BWgz
 xkG5iJyR88lscSKr0ns74FnfcZc/01MJZJVkcjoZVdCTrCxyLOeeb/PvY
 QM1qLv/OIdF2NbsR1Lmc+E4p2VJMwhfi2jyf//Qtq5gklKaZlm1ktDAeC g==;
X-CSE-ConnectionGUID: u+NbHarZQqCCavGmfCZZxA==
X-CSE-MsgGUID: TptLWvAtTwm7Achxm5bzKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101021518"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="101021518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 07:41:17 -0700
X-CSE-ConnectionGUID: 4M+aYI82RHaN3lLVF3EVZw==
X-CSE-MsgGUID: m08j8SSzQZakXn1Mgt6EBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="267381655"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 07:41:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 07:41:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 07:41:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 07:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vohBNy3ixmzmLLdlXe1WLEj/Elhlf7tVSgDVkxURxXDLESed6AuR6d1R7YAldRRzhXeWDH93F+OsXyvw9N4d6IIwAZDEnsnEGmb/wbXjeIOvMG+vsYANPwMOk3nXr2vwdx2JaZhGTPiyCAIHsVaIZRSMulI2Oo+SvQcj6Jf+tjTnafr1O2Q1VEriZr/9cOpom/a6NZ1fcanBPFmulwGAdIRomEtLtnRaOCxEXQLGM0YB2RbOjhOUZxpN8bg/5QtzINX3gse9d6Jl2yI2i8H9r4qyXUQihEteCw+RSARgAQo0KT7//b+UAAe3q/E/xv6LgOYVVg98xRVxHDXE9cuyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtNPq3At/J0Fg20Cyo05rIHTDkME9sLghDqVIosY3Lg=;
 b=Yd7X7TDAx53CSY8UhV6d1bw68Cg1qYZf1ca9fl+aNS+PkujZnQBQMNzC0Ojmj21CDOBxQqr63Odv/UuLA9K8QJ5ZMQ/+BDjNam8RpizkN1/5DZ6SLV9DSjvJ6HesD+zLeVGhW9l4d8btCnoKsOw8Mw0Ohx7NRrKtcrN8skuD5XuA9RWF8MS0UX560psj14mlq2CLN2UErFe/DEkDaZRlKO5zN1+6sBQq0o61DgBR05coIcwC+vtazh2tsrZvmC8x/SnEXmlbP9zAPNwPuKxNxhpYhqbMUDUjnT7QbaMpLfBB9s0DUqv9HgLRWnpHtlZdL+LE7xRwYyCKWeHpUk7DQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by SA1PR11MB226156.namprd11.prod.outlook.com (2603:10b6:806:51d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 14:41:09 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 14:41:09 +0000
Message-ID: <df934dcf-5a91-4b83-9c17-174c77ade36a@intel.com>
Date: Thu, 10 Sep 2026 16:41:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/i2c: Expose AMC Alert reason sysfs
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <heikki.krogerus@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260910124151.3135801-4-badal.nilawar@intel.com>
 <20260910124151.3135801-5-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260910124151.3135801-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0019.eurprd05.prod.outlook.com
 (2603:10a6:803:1::32) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|SA1PR11MB226156:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb6b4d9-5dd7-4e40-7022-08df0f498d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|18002099003|56012099006|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: vR55jQ7n3EHPx6phgJFDRkv/239eqploGIpIXAD9mQUIGPFxkzqQmkQL4nkTFwttfxXEj9djfkNSovVg4/b3bjfNk/LYhD98gYko7F20pDV9sp9VjHbf2hdn+gfr7OJYAWgIpXMavx2KlJqnTuzDhPdw9SDiSG2TXFyqMpNGxZy4+p+cuotlh6cPFi9179wuKhMfu+gySpgJTs1eimXDla8cUb3i7FVXFX/Ig7ZSHLZRRcCftuOSVGVuh+I3nWlu63eaBKZjle+nKv3WU4sMtLyt9/2vYYVJHs8IGr1trJQvFDFK38de9/IyqVkzpvWo/bxCaNi2qAEdTydXRV2dEPhB9g3I7oZlGPj6lXmyZjAflY6RVtwsbOgBJDw8Q6SVDMhuBC2onhDxgybnvZVqpISIlcCavW1eYhQv3aYuh2+FNK2yr3Xdx0nAdjXXpzEtYMtJhsHCh55SdrL7l0FjUjPwavKD9LOwFM76Pi0ANZ+XLmqM5/7R7hWhYTR3kvPr9aUgHFHO4GiR/X2SL7R57rgKDpOfspkVUU/+ZIQ6bP7Ou4305cyi/9a9gXrETEgtsnwWA+ihXF+ZEWJdfNGTfa+zF2Fv6mcqqwsNHeLeCONEsfNomyoivxItcOpf1k358CDDQsxZP1W5Eh5NOT1oIUUAvK/1twZjscd9BgUp0fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1FLSDE5bDhTQVErSThrOHcxczE0UGdicHNXRlVTdkN6MmphbUEyc09vWE1r?=
 =?utf-8?B?ZndlTnAreGIyVU9OaXU4Z0lBMEU1RmVzdUxONjBncGZ4RDNJR0h0NmpocHRD?=
 =?utf-8?B?MGxzTmtqVnNVRmN2REpRK2l6K1ltUDRNUm5JaW93cHlxRVdPck1Md1dBbGFS?=
 =?utf-8?B?OFI0QUNoa2ZMV1Q2NVhjTHNaaEJDd0F0WElCdHJZYXpGVGVvL1NuZnd0MjIr?=
 =?utf-8?B?Y3BjSmtVbWh2RnMvVFdUWEpKZHlSeTJJTm5XSFZXZkw3QzZDYlNNeTNGWVJS?=
 =?utf-8?B?cDhGN09JWU1pYjJtTU5tcC91OWYycnJnRHhZMlNRdUNyRTlVdlRxbTNSbXdp?=
 =?utf-8?B?YklYZzJCbjJua2w1dk9TZFRHQThwT0ZNN1FrMUUyekhNcUw4aENBUkhwck1z?=
 =?utf-8?B?Zml3ZXQ1V2ZqWGZuU1hGd2E5a0FNc2hwN0JYeCtGMi9UWWk2Yi9JRnVRYmp3?=
 =?utf-8?B?UDJ2RTFFT2J1VUk2RnVXSFF5REZnK25ldXd1VjZKOTNhelVaQ1RuM01pNEY5?=
 =?utf-8?B?UjhkYW01c0Nkc0dUNWpzajNOWmxpTldIcC8zL3Z3cFlmNUFuc2F5U0VLMVFO?=
 =?utf-8?B?L25SVm41R1hLM1FGMGFRcEhIbHcvQmlrRDJBVVJZQi84Smh5K2FWZ043TVgr?=
 =?utf-8?B?LzdCeXArcEtjSXdQSHI5OXNzNVV2ZlUvQ0FjOEpEV25xN014OFJzNXZRMVp5?=
 =?utf-8?B?UWcrQXI5enBmZklyWFNBR3dpUk1EVS9Pbmw2OEhWakdkVy8zcDVlVm1mYWJa?=
 =?utf-8?B?dWJjTTdpSFM3ZDdVZzFua0sxZ2hCdFNQcVo0NmhNdG51SUE2MDBnTjdKRG4y?=
 =?utf-8?B?akt1QmRaOXR1ZkRIcnZzUVF3dUdTR1VmSDZrK3VqZmdlZmxYMU9FWndQR0Q3?=
 =?utf-8?B?ZVp3S3VNTHRKNU13cG5ZMWJWbGJ6UzZGT2l1TE8zVnVFbE84WHpFdUxpUlRM?=
 =?utf-8?B?WmRnY2R3elVROFdUWFk5ejdqc3JPV01pM2x3eTBJV055MkJLVWRYT0dLVXQx?=
 =?utf-8?B?WU1NZGZUMW5qbnFoa2U5UXR6aktKSjZVL3R4dHZUWTR0d0hZWXBlYkVEdXRn?=
 =?utf-8?B?ZjR2MDZkUThyZUFCQkJiU1k3NUtwMkw0QTFySEkvQU5ybGsweXordGhKZjVU?=
 =?utf-8?B?UDlWLzRuRHhHU3gyZUZEZVI4WFdaV3g2UXZUaWlPemNuaU93SFVQKzN1bWVF?=
 =?utf-8?B?UlZCbkFBRThPeHZ1V1k0OGFwenZYNjFYNFJMV3VNbnFlcFdGcHhKTjZiTVVP?=
 =?utf-8?B?MzZYc3g5UWU5Qis5V216WFVCWWphZXJSaXdtU3daUGE2YTFCc0Rkd1JRNDJh?=
 =?utf-8?B?d21aQ1Y0d0sycEhKS2oyNjIwTkd4ZE56UzZGZFlFc2NFN0VVa1B2YTNEaWZ3?=
 =?utf-8?B?OXdzUW9kek40YXBvazR2QzgyQ1RQZzBVR0orNS9kSFU5a1hDa3hBcDIxc2hZ?=
 =?utf-8?B?bHcwMk5uNENpbURPTjU5azVFSmpOTGM4TlVjbmdZWllQMHFJUlI5UGVLVlJD?=
 =?utf-8?B?Q1JxeFRMSEZyZWxRNFhEVkkrQkZMOVZ1Umd0cVFMZDFhMm0wbE51cW54TVhs?=
 =?utf-8?B?aDltVEk2NmlVQWtMekZLWno1eXJsbk1NQmhpeUd6SVZIT0lOeFF1RkU0a2tV?=
 =?utf-8?B?QXovOFRnQmZJbzdoa1FkNGdkVThuMHU2cW1sd3YxVjBQSkVmQUNRR1J1TXkr?=
 =?utf-8?B?ejk3b08xWWh5R3Fjc2VvN0FMWHkzZlFXT0VmbG1IeWM3VytNZkR0RnlsMjVs?=
 =?utf-8?B?K2tFSi9NenRETWRmMkxtOWRlbFBkT1B5OFZkV2NQZHBVZlppQVR0U1hmc20y?=
 =?utf-8?B?S0xPL0NSWTFpTU9GN0hFeVFxWXFWNURaSGlueWNZaGhnMEV0SjBwdG5renFp?=
 =?utf-8?B?VTlBTk5kRUFkMUtPeVc0b3lmWWdVT3JIWE9rd1JhVmlVUm12TVFSUGNsamFT?=
 =?utf-8?B?VFpIRVdFMElEMnZjT3B3QkgwTU1MVkZFczFKWE15bHJ5YVhjUFFpb2hxWXIr?=
 =?utf-8?B?Q1h3S1ptTC9nMlBEOHB0emxYNkQ3RHlPdjVBeTBDaVFaUkNiV1FudkZ1Y01G?=
 =?utf-8?B?azlaQ2xDYUJQOWtPQUswQ3JRUnZUODNlcWlXZWhQbTZzeUVOY2pUSElLUWJo?=
 =?utf-8?B?RmtZQjhIMVdaVkNzSVp5Y0dQOEltRnA4b0Q4TnJ1K1lPc3V5SFI1WXJERzVD?=
 =?utf-8?B?L2lvVFhZZjdBZkFnY2lYNm1UVzRhdFdoMGhKSVpDUDZDb2NLVmVEUTY5bXAz?=
 =?utf-8?B?U3Y1bEVvTmloYWc2UVpkc09XVkRlbVZXYWRtLytHVUVmTGNNR3VjQUtya2Ja?=
 =?utf-8?B?Z3lDRWRqYUFQU3RsQ2cvV1BVT1RqQjRHZzdSbUtzZEhEendOWUVXK3NxQ1M0?=
 =?utf-8?Q?2Tm2o2M3iFcs4oKg=3D?=
X-Exchange-RoutingPolicyChecked: L37abD/rv8LuyHCgsI7bJZ6c28XVQO/+231wOB+EzKTDXo7R/LGFZ7sHJ36hqceNmvnlxp+YKP2nFcvwXmjiVj6e7/ESH+IaOdbKIjfzKsWFAi0rdJRnQQzHMzFXUZcyA5jX61dMHCZ3oIuHMTE9cegH/A16Pe3dktWRuIiVwCkqiOdAFNeM33DSe/Gi9ioWAE+zFVnYp2SbJ9CC+nUWscpkTxa4veusSK6diQ4/2cRBZvr7Ruou0fcVZ6OP7Ba7PRErf8Mmsi3QXj0vIQWJwneZTw099kvIehlkrJObPMr14lbKL8HCzxY2R7I8PRrz6KnlithkJWI3Pqyu7pxZKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb6b4d9-5dd7-4e40-7022-08df0f498d6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:41:09.2196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heKjdR6f76sMzkliAPtdiS49Pu7OpOb+sTJT2/Ycy2EBDpt3NAwIOVcxDjJu5meH5dog1fA5reHAoGdNvTT81IDRASELkFUoMsqXb572Mmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB226156
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



On 9/10/2026 2:41 PM, Badal Nilawar wrote:
> AMC raises an SMBUS alert before performing a power removal or
> power-cycle operation. The xe driver then places the device into
> vendor-specific wedge mode until the recovery is performed.
> 
> Expose a read-only xe_amc_alert_reason sysfs attribute to help users
> identify the required recovery action.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v2:
>  - Created sysfs during i2c probe time
>  - Fix Documentation (Rodrigo)
> v3:
>  - Keep limited information in "DOC:" section (Michal)
>  - Handle AMC alert none and unknown cases, document
>    in ABI
>  - Clear i2c->amc on sysfs creation failure (Sashiko)
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-amc     | 25 ++++++
>  drivers/gpu/drm/xe/xe_amc.c                   | 78 ++++++++++++++++---
>  2 files changed, 93 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 000000000000..3bae78d1e0d9
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,25 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason

do we need this 'xe' prefix?
it is already listed as available on xe drivers only

> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the reason for the most recent Add-In
> +		Management Controller (AMC) alert on Intel Xe platforms.

I guess we should add "... on selected Xe platforms."

> +
> +		An AMC alert is delivered via an SMBUS interrupt and causes the
> +		device to be wedged, requiring vendor-specific recovery. This
> +		attribute is created when such an alert is handled and is
> +		available to all users as read-only.
> +
> +		Read returns a single line containing one of the following
> +		alert reasons:
> +
> +			none

other ABI documentations are quoting possible names:

			"none"

> +				No AMC alert has been received
> +			unknown

			"unknown"
...

> +				AMC alert received but with invalid reason code

maybe either change above tag to "invalid" or description: "... with unknown reason ..."

> +			firmware_download
> +			thermal_trip
> +			oob_request
> +			oob_reset
> +			catastrophic
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index edd50bf8261e..bb9d260f800f 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -18,6 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_printk.h"
>  
>  /**
>   * DOC: Add-In Management Controller (AMC)
> @@ -43,19 +44,23 @@ enum xe_amc_alert {
>  	AMC_ALERT_OOB_REQUEST,
>  	AMC_ALERT_OOB_RESET,
>  	AMC_ALERT_CATERR,
> +	AMC_ALERT_NONE = U8_MAX,

is this defined by AMC (as part of the AMC ABI?

if not, then maybe you need private field:

	bool alert_valid;

>  };
>  
>  static const char * const amc_alert[] = {
> -	[AMC_ALERT_FW_DOWNLOAD]		= "Firmware Download",
> -	[AMC_ALERT_THERMAL_TRIP]	= "Thermal Trip",
> -	[AMC_ALERT_OOB_REQUEST]		= "OOB Request",
> -	[AMC_ALERT_OOB_RESET]		= "OOB Reset",
> -	[AMC_ALERT_CATERR]		= "Catastrophic",
> +	[AMC_ALERT_UNKNOWN]		= "unknown",
> +	[AMC_ALERT_FW_DOWNLOAD]		= "firmware_download",
> +	[AMC_ALERT_THERMAL_TRIP]	= "thermal_trip",
> +	[AMC_ALERT_OOB_REQUEST]		= "oob_request",
> +	[AMC_ALERT_OOB_RESET]		= "oob_reset",
> +	[AMC_ALERT_CATERR]		= "catastrophic",
> +	[AMC_ALERT_NONE]		= "none",

is there any strict requirement that we need to use lowercase/underscores only?

for sysfs we are printing text line, IMO we should be good with old names

>  };
>  
>  struct xe_amc {
>  	struct xe_i2c *i2c;
>  	struct work_struct work;
> +	u8 alert_reason;
>  };
>  
>  struct amc_header {
> @@ -104,6 +109,42 @@ static const struct amc_request amc_get_alert_reason = {
>  	},
>  };
>  
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * On Intel Xe platforms, AMC sends an alert notification via an SMBUS interrupt
> + * to notify events such as firmware download, thermal trip or a
> + * catastrophic error. See enum xe_amc_alert for the full list of reasons.
> + * Upon an AMC alert the device is wedged and requires vendor-specific recovery.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static ssize_t xe_amc_alert_reason_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc = xe->i2c->amc;
> +
> +	return sysfs_emit(buf, "%s\n", amc_alert[amc->alert_reason]);
> +}
> +static DEVICE_ATTR_RO(xe_amc_alert_reason);
> +
> +static void xe_amc_remove_alert_sysfs(struct xe_i2c *i2c)
> +{
> +	struct device *dev = i2c->drm_dev;
> +
> +	device_remove_file(dev, &dev_attr_xe_amc_alert_reason);
> +}
> +
> +static int xe_amc_create_alert_sysfs(struct xe_i2c *i2c)
> +{
> +	struct device *dev = i2c->drm_dev;
> +
> +	return device_create_file(dev, &dev_attr_xe_amc_alert_reason);

can't we use managed variant of sysfs initialization?

> +}
> +
>  static void xe_amc_work(struct work_struct *work)
>  {
>  	const struct amc_request *request = &amc_get_alert_reason;
> @@ -158,12 +199,19 @@ static void xe_amc_work(struct work_struct *work)
>  	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
> -	case AMC_ALERT_CATERR:
> -		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +	case AMC_ALERT_CATERR: {
> +		struct xe_device *xe = i2c_client_to_xe_device(client);
> +
> +		dev_warn(amc->i2c->drm_dev,
> +			 "AMC Alert: %s (%u)\n", amc_alert[alert_reason], alert_reason);

maybe we should use xe_log(AMC) ?
> +		amc->alert_reason = alert_reason;
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> +		xe_device_declare_wedged(xe);
>  		break;
> +	}
>  	default:
> -		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
> +		amc->alert_reason = AMC_ALERT_UNKNOWN;

hmm, is AMC_ALERT_UNKNOWN(0) actual AMC ABI definition or it is just a driver define?

shouldn't we still store alert_reason code?
then in sysfs you will be able to emit:

		"Unknown alert %#x"

> +		dev_warn(amc->i2c->drm_dev, "AMC Alert: unknown (%u)\n", alert_reason);
>  		break;
>  	}
>  }
> @@ -176,6 +224,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)
>  int xe_amc_init(struct xe_i2c *i2c)
>  {
>  	struct xe_amc *amc;
> +	int ret;
>  
>  	amc = kzalloc_obj(*amc);
>  	if (!amc)
> @@ -185,13 +234,22 @@ int xe_amc_init(struct xe_i2c *i2c)
>  	i2c->amc = amc;
>  	amc->i2c = i2c;
>  
> -	return 0;
> +	amc->alert_reason = AMC_ALERT_NONE;
> +	ret = xe_amc_create_alert_sysfs(i2c);
> +	if (ret) {
> +		kfree(i2c->amc);
> +		i2c->amc = NULL;
> +	}
> +
> +	return ret;
>  }
>  
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
>  	if (i2c->amc) {
> +		xe_amc_remove_alert_sysfs(i2c);
>  		cancel_work_sync(&i2c->amc->work);
>  		kfree(i2c->amc);
> +		i2c->amc = NULL;
>  	}
>  }

