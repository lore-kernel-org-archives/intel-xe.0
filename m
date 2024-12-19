Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985C4E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 05:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C6B10E481;
	Thu, 19 Dec 2024 05:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSwMbO7Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0210E481
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 05:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734587281; x=1766123281;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=leazLltj7mFwQxudR8D52X2PwzCe0OKjQ1HYUdVRGRw=;
 b=gSwMbO7Y1kgPq50gdbQLKiCL/DogMa3M06OLgr0BMxRD7VuUcgrCRxYV
 U1xCTqQeBuWg+Jft9CSZQP4zMkEw1DtFC4dViYbyLnKHvPmAaTNE1ae1/
 ccGBc29V3842tBtE8v/NW9MTqnac+qMiilDTYwkYtuw8B9LzduOaKAt+I
 hGBPxvDgcSqAn5jDOXUF8sI5+atVHpdD3fAvxysdLjaFf7ge6GU4gmAj5
 oy2/DviJPGDXOW+K8LbO7FalFYl3gqh9oM+E3WD5OECcsCHcZku4RRRGc
 sSvpZThtnOCAUX+9R9R8X3GvdYh0i3d+CSN/BVA0Hfo9Rh6QBjLdmzUcQ Q==;
X-CSE-ConnectionGUID: qc00ARqNQ6mHwKjm/87x+A==
X-CSE-MsgGUID: pgcwq8ViR46datYo0LeSeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52609547"
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="52609547"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 21:47:49 -0800
X-CSE-ConnectionGUID: 8NFZR1oCQm6cCRjr6xfR9w==
X-CSE-MsgGUID: Q9FNWBEETeermTxKGIzZBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,246,1728975600"; d="scan'208";a="98496344"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 21:47:48 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 21:47:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 21:47:47 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 21:47:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THRu1S0iHAFsvimhcVzuEajcv9C73+UWUYkE89wozjZfdhE3BTa3sT3RqULtREoAS0skQAAg4Yl97geRtoh2Xw4V3wGLBpEYrbBegXEciIbQA5zsOR6U4JySB+O6G5k0SICpb+SJNJ0H0NF14y3ZbW6zOUm1lJ3/HJghJOKaawTIE5VIIc5eKwAqHSNVorNGqpGDftCPDPBxk42QdG3o3fYIXCL9P2mhiv+G489bXNiZZci/MxYg//NPazBzsb8tZVIFYJa/rzJDi0DSN10dBif28ow8kY4AlJuwnz6JNSFOWk3nufMguCRc1LmV8qlLvyymP7BhX8+H1ppCWTdJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXU594Ph6IeRW3cVkxj0zblZBMZvTXCsSlnoQw1uwJc=;
 b=tx8qMGS/VOTqd58l6E0LkRfpND3sv+OIhCmaRRUziMb4Ag+eV8nTEKney9coRkexQ8+M3hXqCZhjy1ziwMlnCqj7sYypiG+iehsVkwoFsXC1mTf23E0VUqwLFCqa07bzGBh9crUAbiGCKfo83WZzAxImtiaXcWYCKpbNTD/0VKiYb7nJJ/Jdu2rFjw14YkSPnvC2roHgKCcvjWP6F5pPhdaHdgZsnEAHz53ouXQhDxlr+BjUeO6N/Grn5dPvQ3cnxd8YKuO562vOwkx70SF6Urp1KaaB30cnUgr/LGYjLAq4T7404dPN6xaBxD1XB3bS+5t2talSJWuSrQZ8Hik3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:47:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 05:47:26 +0000
Message-ID: <d3d24cd9-c54b-43bd-a9d9-d7682b4fe10e@intel.com>
Date: Thu, 19 Dec 2024 11:17:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/xe/pmu: Add PMU support for engine busyness
From: Riana Tauro <riana.tauro@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-9-riana.tauro@intel.com>
 <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
 <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
 <erhe5xquod7e7mlr5nnnaqtlzxsvgytrnxw3xczydibvqcxxtt@v2ta2k3tzip4>
 <517cea2a-96ae-4f78-9761-ec3f553516dd@intel.com>
Content-Language: en-US
In-Reply-To: <517cea2a-96ae-4f78-9761-ec3f553516dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 58be8b6e-7b8b-49b7-e3b8-08dd1ff09e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2xQaDFzMjVyazFPbTFtd2hYOUwxSUd5Wk8rOFdYNGhqSG5VVGJwcXpMU3gy?=
 =?utf-8?B?OFhBeHNDSkhleHo5UStxS2NZc3hpeTRncE9rUGdnTHhWeU5zVkZXU2t1U0Jm?=
 =?utf-8?B?blR5ckY4Y1Nxb3lzM2dVRGdMK0Z5TSt6MWhIUXZUNUVNcXpiUkdOYTY4dUk0?=
 =?utf-8?B?Q1gxN20rclliMHA4Q2UzTDZZNWFrbk9zUElhWEtiTzJxYXJiajA1eVlDMnRI?=
 =?utf-8?B?cEdOQU51eHlzMXlDOUhISjViWTFBa2hqSUswZDkzeFNqeE5EVzRKTWN4aUl0?=
 =?utf-8?B?dWhkeWEwTEU0RW9ORDV1QTNHcS94K0V6ak5hOU42eDhBWDlzdDA1K3NpY2Mr?=
 =?utf-8?B?K04yK3Q4THpJQXp1Sk5FT05aQ1RydXV2UDZsV3M2aGwzQXhKanNBUlFCdVF2?=
 =?utf-8?B?SEpzZnNEdXhRNnhSRzFMREMvRTN1bnQvaHh0T0ZRalF5YnpkMlk2a3NQaEt1?=
 =?utf-8?B?QUg1WG5lYVorSXphb2lTcUxjbTQxWDNLbFFwK3l3Mi9ZWkpMK0VHYks0NGRY?=
 =?utf-8?B?Rk81TUJjTGJWZ1NVc0lTSVMxVEtJR0ZXYWFhbGZmSVFFcHZCUk1aNCtlUmdC?=
 =?utf-8?B?UWJPRERXZjh3cDJZaGFyNSs2eHBESGNrZnFrdXR1MnJuSmhZTGJVeFRISC9W?=
 =?utf-8?B?cFpwaTZ2bGlPYTBkbUJSSmpkcktDaGZSMEJEcTF3aHBnRmcxWFd4RUErVmlu?=
 =?utf-8?B?WnkwR3RwLzdwayt1VXVTVzZ2dGpwQU1MbXpMN3czREg1eW8wMU1TQ09wQ2Iz?=
 =?utf-8?B?VTFOM0l6S3lyUUExd2s1SlNrRmpkZVVTREphcWpMd0NXbVFPeUxxWGxTZmdX?=
 =?utf-8?B?bTNzczd6SzJlTi9EYVVod1EzYnNtalQyWm9PTVdTSXBieUd4LzZDa1ZxT2Vh?=
 =?utf-8?B?WEVzU2IwRTFoR3Q1OEdBcnVwa3FqUEVDTEhLbnJRcUJSd2dqYnFNNVpTc1By?=
 =?utf-8?B?RW4zNUZXMno2L21pbTVUaXdnQThndnF6eWo3QUZwWEtBa2J3SlE2ejRXN2Fa?=
 =?utf-8?B?dnJtSnlOSVpoY3VhQ1dJb3VOSnhkQWk0ZTBsT0RIYUJvd1ZOZFlmekRsVEk1?=
 =?utf-8?B?R0tFdjJ1RHlNelZWN1VSYkp1WFBlR1MyemR3NG9YdGRZSHlCVFVCalp0VlBu?=
 =?utf-8?B?NGJyRWpnN0xjMjkyYXV2UmI3RmRVSzlHcnFmUStDdUdLN2FOQ2lSWE9QUzRU?=
 =?utf-8?B?UFIwZTlJbUsraFlyL1MxSkZRRzhjeTFYeGtLVk9hRmw2RnQwd2RCaGNDZ1Zw?=
 =?utf-8?B?Q2RONWtIc2F1R3RFeS9idHpLRUhkVjBxYmtEV3IwU1hNc1lIT3RKZ3FwSFdC?=
 =?utf-8?B?SmN0eU9WNWtDQ1J0bWUyWmtPVUl6M29nNVdBYnVINTY3UTlRRHdML09udGRY?=
 =?utf-8?B?MWVnSkJ1MnZVU3A4YVArcDdUM2JvN1FENUE1VnBMdWdJbGxvZ0NLaWRYZ3dv?=
 =?utf-8?B?cnlUMEtFYStITk9yWWRJV3BBNlJzbndqZElyK2tjbjhQaXkwSWN3YzlqeFpq?=
 =?utf-8?B?T1J5S0VzVEh4OHk0aWMyS3ZIaGR0WG5HbStvdmtjQmpOQ0lSK2grU1h6ODJK?=
 =?utf-8?B?cGJIRnR6MEdKYnM3VlJCazVhQUE2MUhycUVGRFh3NlIwalM1OWNRRjJ5eWNy?=
 =?utf-8?B?dVdlRVJVU09ROGJXZWlFVTdmVHNXVXM5ME5TUjNjSllIS0kvSzVPTm9UbjBZ?=
 =?utf-8?B?M1JpN0dKQmI4bWJJWC9uVCt6Q0ljbDgxeU9VVmhzOGJza1dObE5OVkJicjhp?=
 =?utf-8?B?SE5haDVBNFE0Mk01RGVQYzhxYlQ0aGJIL09CelRscXZTN1BDV1BzTnZvK0U5?=
 =?utf-8?B?Z1RDbUlMaWt3Z0FESEpEclorVWFvaWJ0MWNCWW5sMy9IN1JPRE9PeTIxVUNG?=
 =?utf-8?Q?YcbinrjBdaU14?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lqNTJySmJXaDV6VzZ5MmU1ekZ5RVFCTlovM2lRa2RUSDBtSVQ5bTRQczUv?=
 =?utf-8?B?SkorRnBuYW9yQS9SOUhXcDJRRzNnYjFMMTlrd1RGL2I5RVdZYzg3V1AzdHp4?=
 =?utf-8?B?ZmlHREtJMWFCZVBOdzRFOEFHWTRFWkNuTHpDWFZqUlF5NmJVNUFZMmVNRE4y?=
 =?utf-8?B?V0h5QUxVOTN0RlFqcnJOVE9Idm9PVlRBVStBQVR2ZDE5WHJOanRncnAyTXlu?=
 =?utf-8?B?Qy95SklVVmN0bEZJeVEzWEY4c2N5SW5PSDk4Q2tpeU4xcTc4WWFoWmhHbTRk?=
 =?utf-8?B?NjVPVGN0MllBdG04U21KZzNJQTl3ZlhEYUtCeHdCdmdtZUJHQW9rQTJWYjdS?=
 =?utf-8?B?Vlh2VXM3VnBCbm1LaVQ5akUrOG9lSVcyOGJrTmpxZ0h5N2xnZFViQmVBQjI0?=
 =?utf-8?B?TndQTndkUldkbUFCTUJvSlNYR2M3S1FZdmdNbjVmQm80SlhpTSs2RTdRRVFq?=
 =?utf-8?B?OHFYQWJadW1NNVZycVl4OXFqREFnZE5lV2pnWUw5MDBVSjZCaHBJdWR5d0lq?=
 =?utf-8?B?d05SRzI5RlpCc25UajBrVHpqeFhWL1dPcnllbmFQdHRXMm9pOFhkUncxN2hS?=
 =?utf-8?B?eHFuaTc2OThkL3NjbzVHb3FJRmtFUmlJN0NOdE5FSExkNFFMYlh4UEpjN204?=
 =?utf-8?B?TXFvUHlYWkQ5bi9VeHNSTk01cGF2YTdmdXJaaTFnd2k2UmtyaFJCOW91Yit2?=
 =?utf-8?B?QWZWekdmVHVZejE4Z1dZV0luaXFjdHJTcWxIS29aandwVHY1VS9RL2REMDUz?=
 =?utf-8?B?R0V4VGxKbmNDRmM3aFd6L0R3L2JuM2xHT0RJRDFMdC9Ld204RURnMjhWNmQ5?=
 =?utf-8?B?UkJrOU1nWU9IMDlBUFI3a3FxTHplR2hDenNmNkR6TjJhRERmUHpJMk4zQW1G?=
 =?utf-8?B?ZDY5M1FJQzE2OG9FTlp3aDVGUmg3cUhoZ2pkL1BuUFpvaXBMOGV2RStqZFRn?=
 =?utf-8?B?SDhObHFKbWVFUlg4TmN6cGViQjl1MDh2cTdKckRmcjByVWlJODRoVGpXUzFa?=
 =?utf-8?B?c2p5bXJubEZjY0RrUi8rY1pNSzBVV2F4cXhXUkh1dk0wa0JOQ2JQc3BESWl1?=
 =?utf-8?B?dEhBR0VwYllkMU0rN01uRVNpZXJDb1JNcDNNL3lQU0NuZzBKQ3NGdlZ3SWta?=
 =?utf-8?B?cjkvSjd4QmI2MW1zY1Vtd2NwdWJpWlY1ZlcyZWxjQnArWkNUQndUcGZUMU45?=
 =?utf-8?B?WG5NMTVWZS9IbjF2TTVwQXYzTGpVSHhWTU10OEM0eHpkMkVLNTMrT3VJVzFV?=
 =?utf-8?B?L2h2N1hwZzZhK2pzSVBLSFJOSzFvaVhNQ3dPZjNkbFJZM2RKeWk0dkp2WTAv?=
 =?utf-8?B?WTRwY1Z4TzkzY2tvVE9TSlVBNXVVS3VFL1pFVGZJMDBYUGZUYWNiTy82WUth?=
 =?utf-8?B?dVhIQXJ2aW5xT1pVZUlIWllydzBnakhlNDAzU2pDZHdhLzNKZ0Nyc0JQcWRa?=
 =?utf-8?B?L083dWJZQUN4ei9YU3RxZ3AveGszUWJuZkpPNytRRlZ6WkQySFdvcFRIVkN4?=
 =?utf-8?B?dUVvenllcjdjRG0xYzM3WEFnZ21odFIrR2Q2MThzeGpuVENsZFc4REN1cXNV?=
 =?utf-8?B?MGR0bWsyVEdDeTFCWGNnWmpvU0N5UDZxaGtpejlQZXdSNUtpZFpmVHVhbm5j?=
 =?utf-8?B?Q2pqVk54RGM5d3kxZnlnNkxWeGxrTlhMYXg4VVNoUCtzNitNUEhodDE1MlZN?=
 =?utf-8?B?RG1WL1pVRThoR0tWTGVhd25ILzRuZ1BvbjlFYW9KamM0SGc1Zks0bFE3c2JF?=
 =?utf-8?B?L0haVTVZWWhtQzZDRWtFUVdEZjRnVGVjOGVqaEpzR2o3ellyR3B0b1kxVHY5?=
 =?utf-8?B?M1YzUVl1QjlmVURHWUZ3SXQrZ3NURFo0c2JGcWgwVjREdmVURVpwZ1QzU1VP?=
 =?utf-8?B?aWtpVk9VMmNjVzBkdkFydVRIT1hWTVpBdE5scVVrOUtzRC8rU0Jqd0RZak5H?=
 =?utf-8?B?eUxzUE9lellXMmRHU1M2bEpzaVdzSEIza1BDWVlJSGtjcVhJWERmV2liM2RR?=
 =?utf-8?B?YmU2QjdKa0NOdkt0Z1dJMVFtREZrejQyU293TGY4TElHTkdoNlhXNTN4WVI0?=
 =?utf-8?B?S2p4TnFrQXR0cXBFR2RpaXlGM1hmSjJ3UGtWaVpORmttY3lMWXdrRFFWQ0M2?=
 =?utf-8?Q?VO3KsaSh+SrK1DLfRTcLw70wv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58be8b6e-7b8b-49b7-e3b8-08dd1ff09e45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:47:26.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wJKyWjS/sourZBOweVHqk2y/4WZZ7tFSdlwKizR/ypK84fa3/I0fZXCPQIalMfwrDGR+EzGrZ+KyuH+A/UvQCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
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



On 12/18/2024 8:21 PM, Riana Tauro wrote:
> 
> 
> On 12/18/2024 7:43 PM, Lucas De Marchi wrote:
>> On Wed, Dec 18, 2024 at 10:42:53AM +0530, Riana Tauro wrote:
>>> Hi Lucas
>>>
>>> On 12/13/2024 11:28 AM, Lucas De Marchi wrote:
>>>> On Thu, Nov 21, 2024 at 12:09:04PM +0530, Riana Tauro wrote:
>>>>> PMU provides two counters (<engine>-busy-ticks-gt<n>,
>>>>> <engine>-total-ticks-gt<n>) to calculate engine busyness. When 
>>>>> querying
>>>>> engine busyness, user must group these 2 counters using the perf_event
>>>>> group mechanism to ensure both counters are sampled together.
>>>>>
>>>>> To list engine busyness counters use the following
>>>>>
>>>>> ./perf list
>>>>>  xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
>>>>
>>>> this will need a rebase on latest versions of the pmu patches as we
>>>> moved to have gt as a param rather than mangling the event name.
>>>
>>> In case of multiple gts, there might be different engines for each gt
>>> So should we display a common name and unsupported in case the engine 
>>> does not belong to the gt?
>>>
>>> sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/ -I 1000
>>
>> why is engine not a param, like gt?
Wouldn't it be better to have engine name in the event name? Otherwise 
anyone using perf tool needs to find the engine class to name mapping

@Umesh any inputs here?
> are you suggesting to have both engine and instance too as parameters?
> Something like this?
> 
> xe_0000_00_02.0/busy-ticks,engine_class=1,engine_instance=0,gt_id=0/
> 
> 
>>
>> Lucas De Marchi
> 

