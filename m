Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30856CAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 14:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDD810E551;
	Mon,  8 Sep 2025 14:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5Xvlvv8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4529F10E544
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757342871; x=1788878871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u2GHEEpsuHJi+8CSwkvoG9VIKlfDC7Hh6IaFbFLVPt4=;
 b=G5Xvlvv84O87H/E6fvXecXK4czUCjmg1GyntGoveFe1WQvilhieV3VAO
 s9PnKikP/XkmhVWmmgYBxpguX06kaNol8AG8PZB30vHH3PjZ+RncHmE/l
 6MJcYlfZ2kxUvaNCU0se/rVrzrt+p96aqyTfGfMJ1xj7G3FREIRD2g/d/
 x+izr7ED/DzUHFAAcWBarfsH8Ne6t+N5EY1j9e0QRK1g/OTpvGm6sg2IC
 N3uvWTFlVTH1qCr/LhM/pRqITKMUT5jKmkHdufoU9sf+bS4inOi2EiFJj
 X/0uwYOmo91ZIYCg7mYRkQrLiMSNNmk/bMVaUnuowQBFf+0v97ICw2UEh A==;
X-CSE-ConnectionGUID: sTbzcRBSRaGa06Xf4t0ebQ==
X-CSE-MsgGUID: yZsCTvzRSBGqIaaP+NpJbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59460056"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59460056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:47:28 -0700
X-CSE-ConnectionGUID: pzeXtlH8QzGQ9FkZBsW9Hg==
X-CSE-MsgGUID: SPP2PgvhR/y4cQ6IqaOh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="176864800"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:47:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 07:47:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 07:47:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 07:47:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2EFf07QkHQzDuxQ564DFtuH2iOHn2e7vE7NsD6TBIeMoRbUnJyL1lNnAB7PSgtYCYM+nZp53DESQT0GCQZhhCbILTMVv2AdUIvN7dI3PnDghvK109Rg84w4VXx07A9EjTudf9hy/Bh2Q0gmLhBrVNz8ODNdXDaKp5AeX7XtrzJDx1k5UMaeVphTBlGXQsb06GXN7rDFqJCuGAU2IR/EJtPJSuPgubtGQClpCgXPIXIK8Tll8f7T5Z35XwaytsCz3C143npl47VOTsuZoS1HCNUQJQk88x2658IDRWtnX0QgiMq+18ZmvgtZuk0nsjx5FcdEfowjLzAvkNasb3Y43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8gbI5DFlegIPeArJDHil9Yq/NFC1p2MCymz72lz/K4=;
 b=Zw9b+ySkoFxyKgym7upiY/Nm8ocfevjNtDaFhDFb6x0hoKBdnsdzYdsLk3VJJ+3mmYyje+V1dbZ161WfJ3L8PocrkLAlEygMfwhYy9nCdVxsxrIa7yLRImia96cWn5hoi00GOe9skNC1iGhG1JTNK0t+cnVqaC6UD5mZD6FWSUJjefAtfgEddWAaUxgrIiu/NjN7qENVsY0a1JnZ8QsGe0GVh6opE4jZDjtGIji/gsnEW/EbtUAuBJVMZSmYbftgnoYpgxSJDug3Z7P4lLnY1VXdRRKxFsg6aJpWqIN2A7KNjbR9FMq8wJyaU3UtwirXMUPfEZ5tiP6GuLa2YTzFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH7PR11MB7099.namprd11.prod.outlook.com (2603:10b6:510:20e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 14:47:24 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 14:47:24 +0000
Message-ID: <13646b1e-118b-4a97-983b-48e2c162fec1@intel.com>
Date: Mon, 8 Sep 2025 20:17:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: drm/xe/hwmon: Resolved incompatible cast
To: <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250904105857.2293034-1-mallesh.koujalagi@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250904105857.2293034-1-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::34) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH7PR11MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c99db8d-db08-43c4-8e8b-08ddeee69f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTIwbzdOUjhzczBEZm03TEYwRTAxQWtBWTB0Umx5dVlFbTBHYjhhMSt2MWdz?=
 =?utf-8?B?Uk9kT1d1SHFHbGkrODNoQ0dDcVJMVmZpVXJZY2E3V0dhQ3NXakRYQ3ZkV2Ns?=
 =?utf-8?B?eHkrWXZNNG9DZWFHa0NrOWJ0RGo1UkhIYU90VVc5eS9OdTU2M24vT0lKYzUz?=
 =?utf-8?B?ZWdwNmgxL1JxaWFkSE8rMW0vWC9NbStvQkluaUVMSVdhdXVtVmVQZms5c0Fo?=
 =?utf-8?B?c0NyMjd0a041b3MvZlFEQVFHUXU5YW9QUzlpdG9wa05pcWliUEtsZ0RvZkkx?=
 =?utf-8?B?V3JIK0RQby9ndDIrYk1vRG1NMVN3dmFQMTQ0bzk4SEpUYlRxMGtRRHNoZHd0?=
 =?utf-8?B?dFhrY3pSY212ZTUyU2tsREpla0dMemlRTUFpVkZDMml1Q2FkOU1yZXFweE56?=
 =?utf-8?B?SFZKeVlDNXVFckJGWXZoVnNEa1hQTUlUNVd3cTJKaTlqTm05eXUvWVZZUDB5?=
 =?utf-8?B?aUJHcnNaOGNkWTFTUFovelF1aVNCNDdlYVVqWjJLbDMrT2dsL0NEcjhnZTFj?=
 =?utf-8?B?bGZtOXJTQ0JVNjcxaXdUVTBVaUlHREU0ZTJJRVZ6Y3JnSW12V1E3WDBwZUI3?=
 =?utf-8?B?NGJyd1pNaVMzN0VJdFB1cEEzZFN0SlJLTytaMDhLTU5HYmc4c0dFNWljb0py?=
 =?utf-8?B?cmM4czRFeWpEVjdYcGZEVWcxKzJIZTNJZmw1QzhqeTR6d1c5MUJlR3BnMXdP?=
 =?utf-8?B?NnpyL0EzdXFFaVlwMGcvQUcrTkt6NjF3UFJtMkFtUkxVaGdheXpvRlRXOXZu?=
 =?utf-8?B?L1lNRXlNTC8rM3BKNjR2VXBIdlNORFplZXpmM1ZKOE5zSGQyaGxyTXpXaTdH?=
 =?utf-8?B?LzhobmQ1dmhXcDJ2aHppWVdwT0RsZWpuamxvaVQydDNoNnA2NjdMbmhwd2Rr?=
 =?utf-8?B?QW9VWkJYY3NXUkFQRmZZSU13Qzh2VFB6VlJEaHJiOVkzSDg3bHRqbWE2Slhk?=
 =?utf-8?B?RWR5MnVwS1RqMjlnTC84TWlXN0Z3Y1VrWTZWQU9vTmpvczM0alpIenlOc0xI?=
 =?utf-8?B?eDdaUjY2VVRldFVta2JvRnR1dzJHMnZMb1pNTG9NUWkzd2NJUDVtME1jTU1h?=
 =?utf-8?B?eElVQklnVkgxejZPQlNad3lqcnZSSmxEWE90YXM3UysxSW9xVVBITU1lWnEx?=
 =?utf-8?B?N3RJWW9pSVppLzlET2loM0ZQaFIvZEx1NUk1enduMzhBbWN3R0NIQW12Umc4?=
 =?utf-8?B?QjAzVEg3OVRQOGZkYUZGdlJiUFljMm0zeVZJS1hVMmRxNmNncVdKSXVvUGt6?=
 =?utf-8?B?S0RGOWJaZHlRN3MwTlkybXBFY0djbml1VDJpNmJuRW4waFpZanFuNGNHSE8r?=
 =?utf-8?B?WGg2RmVLZ3l4TlB2OWNEUnZzSjRiRFlGTTdXcndSQzViOWI0QjlHUFQ2ZFdK?=
 =?utf-8?B?elY2RnVqMXcyc0JqT1FwbUkrWVJjdUxueFYwckJndHFGRWhsVUV5S0ZwNHdR?=
 =?utf-8?B?QXh6UXE0dXlnZlZYMUpRZ0Q1SFVhVVphcnZwL1dVc2poN204VWZURVp3djUw?=
 =?utf-8?B?YVJoN3RaT0IvdW4xM1pSQSs0ZCtyaDNJQmVVSjFKV3BYYUZuVHNxM2lveXN5?=
 =?utf-8?B?NXYwSFZJZXJTU3hGNC8xRzBGMGExNGsvRGFSczY0ZHhqWitPdEpNOVVlblRw?=
 =?utf-8?B?aXV3VGJwYWlBeFdkRlFQT1dSUTE0NGZyMkRoS2dHRFVRWXJRcm53SVlIRUFw?=
 =?utf-8?B?enBvdlp4RlYyQXpQWUd6eEQzRlBWZENFM1ZQeTJvRlc0QW1Fa21oVDdJMWFR?=
 =?utf-8?B?MVIrdlNWdVhBdVQwdTFtKzRGM2d5Qjh6RS8zdi8vclowb0hPTnFRK2J0czRP?=
 =?utf-8?B?OVhHMFdvY2IvRkp0RWdjZzhHUEhVaC9jcUJtcWl2SklyMmcyeThreHVmZHN0?=
 =?utf-8?B?V1RIdlFCbEExR1Z1ZFFodTJoUStKeUYrcmViQXg1OE9xWWNVSkhPZmJydG5p?=
 =?utf-8?Q?SYpk5ZR7iSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklTQTR6Y0RORzJPODFuRDRtdWFaUHI0N056eXhKRkc5WFNZMTNBdU1tRmNJ?=
 =?utf-8?B?Tjl1RmV2NGhOblJMeGlzUkQ0WThoQVd4NmQ2V2pRaWZ0WGdaUHdpZWpldm5X?=
 =?utf-8?B?Z1Eyc28wcnp2dit4N1Y1UFM2NEdPS01vMXhlZ21EVkI1eXFHNDNtcFQ5anNL?=
 =?utf-8?B?QnBBMTYzRmlLclBDbS91UWFnZXIyTk5ibmR3N0dQalFUWGpiWFZNMUVpL1Nw?=
 =?utf-8?B?eW52NVZXYW92TWI0b3MxTXVyR3ZHUXFoVURJbjdlVE5NeFBpanZnTk8xQUpT?=
 =?utf-8?B?TGl3YS9KWlBWWmVOdE5LNGZXVWwzclVWdjV3WjBTemIvY1ZHTU1yTDRiTWxh?=
 =?utf-8?B?WGtLWWdSY2hWSFZtendvamdvMzgyc28yVTBKdktYN0FreW5KMU8wWklVVTMz?=
 =?utf-8?B?V3dGYVFvSDVjZ0VFT1hzZmtFaENqOTVGRWdJQWNHTVBKRldMeW1pWnEra3pD?=
 =?utf-8?B?VFNxUFBodUtLZjdSWk5JQmI1VHcyMzQvLzlKdUI2OVJKa0ttTFpEeUV6aWhI?=
 =?utf-8?B?WFhnT0tIMlRsbHBZeE5wd09ldGVVS0Y0U3kvWHZOaTJHcmxOdGZ0clgyZDE0?=
 =?utf-8?B?RGwyZVRURXQrUi9rUnlnaFp1dFJHSmJVdEd1NDA5SGRQUzZIMW5GUkQ5dXNI?=
 =?utf-8?B?dllNdEErN2IzSjhJZUhmTGJaeit1NE0wVEduT0dZeXRETjRZVHZ0dm02bFFJ?=
 =?utf-8?B?a0hySGtLWUgyMGxEMTFXUEVRVFBPa1hsM1Fib3UrZW0xTGttVWtITlFnVTc3?=
 =?utf-8?B?b0VsejJFLy9pK2ZNRGdRbjBJNC9kRGpGcDFYa2tMQldsQmxoRXFESnhtbVZ0?=
 =?utf-8?B?ZkpXWHdodnlINDd2TEdxS0RIOHE0UlNwaDBvZkJVWk01cDMxa2d5Q2V3SmZq?=
 =?utf-8?B?UWdOWEpnNk1nY0JzMUFvbklNSjlaTjN5ajUzMmxZc0NFL284OGhUcE1qTFYr?=
 =?utf-8?B?MjA0bjBUdTZCVyttSXpjWXk5OWhMZjF2QUsxenNOQ1RLQ0xTOWE5R1dMeEFX?=
 =?utf-8?B?VEJPRU1iamlxOHhORVE0dnhucVpxMDEySWFQWnZwL0t4VFJuRXVNWmhOK1Zl?=
 =?utf-8?B?ZWpTcytGSXRYZVdsQmhKZGViK1VNSGRyY29KYTVVdjhxYm0rWG1GOHpiNktz?=
 =?utf-8?B?cVB4dURVeTYwdjJnVXdWWVFoS3JrSEs5QXRZc0g5cExHeDBMdnFPa3M2ZDFR?=
 =?utf-8?B?dGJ1UlVGRVdHbHB3RCt6OTM4Yng5N2laaUpmdUFlaExZOHNrcXA1K1FZVlcy?=
 =?utf-8?B?SXRMNkJ1SjdNM1EyZm9EbDBrK1RmOWI4NmRiU3V0T2pXNm55ZGtaUW1Jc2NH?=
 =?utf-8?B?dmhsMG13NURScUJtN0FqamxnK2F2aUFjVitCZE1YS1Zxa0Y3ek8yU256N2J0?=
 =?utf-8?B?eEMrV3pmZVlOMHU5UGNQRU54cnVUa0h0d1FHaTZ4c3VpekpIRjYyUi9hanBi?=
 =?utf-8?B?NFpkUHE4WkFYU1lXL0ZNaUNhQk4rTXpwWGZ4ejc5NCtMelA2YVh5ZVNNTHRy?=
 =?utf-8?B?cHBlUmZuUU5EdUtvNnp1YXdabHFXS29OTlFTV1VmekxSTUdsQmdtREgzTCtr?=
 =?utf-8?B?bkZBcUptV2lnd29JbGlGSUpiakF5elFlS0RuK1J4dTQ5V0x4Y3VKbVZTZGRF?=
 =?utf-8?B?ZFF2djlyczVZWUJnbEZ3dUpNL0tDUjF0WFM5UVdvNVM4eGxNYzNNZXlMdFl6?=
 =?utf-8?B?bUY4c1E2Rm0rSDFZSjlvRjBYeWNqTHFZUi9pbm9lYkRPS0dKQlhLclR6aTYr?=
 =?utf-8?B?YUFzR0o0K1RiZHZMNndtSFBLUXNONnBlOEFtMWE5Y3MwZjRMNEtDN3RFNmhj?=
 =?utf-8?B?am9yY1p0MmJwMGIxcWJUZW43ZnA3cU1jSkdIdXRUV1ZiL29WeUdJdDd5cTJ2?=
 =?utf-8?B?QkJnOTd6eDFoSFFVQmZXdnduRWdkOGJBdzQ4Uk8rQzE1NmJqOVRCVHNYSkQy?=
 =?utf-8?B?Rm1tMXprNVF5WVN2UzRwSmRORXpZMVZzWVRWclpDbjdMeGZqdkdzMmt2QzR4?=
 =?utf-8?B?enBhR2FTVUNGNlVvZXFCcW9ncWhTWUhhMWxuOHdFN3VFZnNuTFNsMWRRZnBW?=
 =?utf-8?B?Q2lhOGFkMUNDZ1JQamdQZ2c0KzB1b1RFbnk3VGNrTWVHcmRaQ0ZuSWtXUHNI?=
 =?utf-8?B?a0FDM0JoMVdnWFI4UGZkTTV2ZDVGcktZQTZOZGhjTjNURW5XVG4wZFFsck5l?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c99db8d-db08-43c4-8e8b-08ddeee69f18
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 14:47:24.0144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FIBy6ERCHh/Ej5ETNsYCpJzU9HnXXaqqFLwHJ8PMdtNz04GWQO855tlMzsCcCyjdnmFRDffdzhgss+UNK/shQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7099
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

1. Commit title and message, should not be in past tense, it shall be in 
imperative present tense. viz: Resolve incompatible cast.

2. Title can be rephrase as : Ensure endian-safe casting

On 04-09-2025 16:28, mallesh.koujalagi@intel.com wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> The issue is that casting of u64* to u32* cause an endianness
> problem because on little-endian systems, the function will
> write to the lower 32 bits, but on big-endian systems,
> it will write to the upper 32 bits

Commit message can also be rephased to -

Handle endianness when casting u64* to u32*.

On little-endian systems, writes will go to the lower 32 bits; on 
big-endian systems, they affect the upper 32 bits.

Avoid this by using u32* pointer instead of u64*.

3. You can mention the Fixes tag.

  Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
limits though mailbox")

> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..d21f8f8678ab 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -294,7 +294,11 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
> +		u32 reg_val_32 = 0;
> +
> +		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val_32);
> +		/* Explicit, endian-safe conversion */
> +		reg_val = reg_val_32;
>   	} else {
>   		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>   		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> @@ -490,7 +494,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	if (hwmon->xe->info.has_mbx_power_limits) {
> -		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &x);
> +		/* Explicit, endian-safe conversion */
> +		r = x;
>   		if (ret) {
>   			drm_err(&hwmon->xe->drm,
>   				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
