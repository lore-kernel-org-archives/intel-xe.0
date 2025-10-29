Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE30CCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 08:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053EA10E72B;
	Wed, 29 Oct 2025 08:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkWV+6m0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D533710E72B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761727264; x=1793263264;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2GSU3rmUaAUTdkRPQTXFIPCqfVCtUDu/7OVaqXawodU=;
 b=NkWV+6m0O7uoLHMf1/lAhavub9aGfIrGRPAq5l5aIHyPK74FiOfsO1MH
 MXGydIQIXJuJUaObVyt/lWqCPm1en3zZ3wA2ISQIDW6qeWNxcZG/ZQKFe
 Bb5Xm1+H+r1axiF/EWA6dZplYiA+nAks8CI7xXzWgPywpLA68UNxiuh1Q
 ZTaFLIBsaNZB931sJ9PaV8Oei7Wcux5+Niw7QQ0kL4PzRfEqvFIoWk5RS
 4+pSuqKeMxXjwkCBNLeTNX1pdHO6iWAQ86W8kUTXiuq1JgEfMdSx9Ig6W
 A/HVTWLng4adWt28ydNEgvjxT4MMxUct3lxUdPw+T/uODCuuamwyj8LxY g==;
X-CSE-ConnectionGUID: YK40NkauT+eC/OqXgjuhyw==
X-CSE-MsgGUID: QIyzreFMSzSy8Z6EngBDDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63770744"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63770744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:41:03 -0700
X-CSE-ConnectionGUID: fAwBCGFSTKuTCNtsGuHdgw==
X-CSE-MsgGUID: BZ9onoSqS02ldGEZfyQHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="189658678"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 01:41:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:41:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 01:41:03 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 01:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVp8gSo3vzYV7Vxl9vG6P9r2pc0btkq7YnyK30ZwsLgJzCxpufLAsFaF5ehhCgWsUqMTgLFMgox0ftBgSuTjYGeKR9xqU5ZIFyr45Y/vq9I0H2NuYdu5u+WXS5esFl1RKCeOJHvx9ej4p0ZamD1oj2CoDZFCejdB46HX75lXgf4MR75WGuoxROfBumoFRAX/py16RWRRKaasCIBC+XR/9ezxr674FPcwhdKtfphq5qtEAWvn68wU8FxDBF5/Yxb7u61Jh+3UM0hYNRG+B3ijfjFJSvyOOAKonLALMH0nVzLmXhi/uL4+Qnt2YKJWuPpqiDR2L69Ksrhabxqhb/wPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDSjwUg38VxQWaOToPPkZrfqrME/xCbiVLTIBAph9to=;
 b=omNYGEsg1ln4Qo9GXV478t4XPDmWop9pnMAoooE/0v/57P/OUQiItImFcuXRYkcdMOW6wEnv6RIWzi+mXFeQNSpSGBkpNFWsWi8fbuZVMBKs87X+dlOBNwq33i+fO6PhwecvoGAl3Ub3eLIOcWScyB2jTcC2SEQuqkNUt6osb+lZHMLgwtRm2WtJdrhmi6IW92tBh9IvFur2DmqxSgxUTIllqNKQwITpHCHbGmejBgYM0RzHv0RZJeu9hmM72C5EeNWITgwk5DDVSL5BFy6gn1xmjx7enUyR4dKh8FvWHsDLW3YD5bWr7vSQoE7TxPlUiFTwQ+fRNocMxC4nT+coIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) by
 SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:41:01 +0000
Received: from DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18]) by DM4PR11MB6096.namprd11.prod.outlook.com
 ([fe80::f3b4:61a8:7022:df18%7]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 08:41:01 +0000
Message-ID: <24e496a4-7573-409a-92fa-875553204b33@intel.com>
Date: Wed, 29 Oct 2025 14:10:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
To: Matthew Auld <matthew.auld@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
 <d2b6819e31d1bcfc032ee1be2e75204d5549f583.camel@linux.intel.com>
 <dda281c6-5b38-47aa-b8fe-b515f4c9f0d4@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <dda281c6-5b38-47aa-b8fe-b515f4c9f0d4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::22) To DM4PR11MB6096.namprd11.prod.outlook.com
 (2603:10b6:8:af::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6096:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fec0ac2-ba67-4861-0738-08de16c6e367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlVHalllL1ZwL051VlN5bytmdExiMS9SWThkVW1ld1Nra1h1MCtncit3Z0d4?=
 =?utf-8?B?Z1ZheVY0aXdGcFpjQVNsckF3aDF6K3pweTE1QnZhTHBlWWJHbi9ZeTNmZVR3?=
 =?utf-8?B?MWQ2T1M3eEY2SUNPT3JhdDVtMGZqRGJwaS9PVEZVT0lJdTdNcExhM2QyQllB?=
 =?utf-8?B?b2dLZExVZVlJTjFuN2RGbnZ2M2NKb3ZCMk5CRHE1N29nYmVjemwxRkdsM3JI?=
 =?utf-8?B?YlRleVpHTWlWdnNiUFN4OWJyS1BrRTR1Z3NsN0dRR2syUWpRT3cxV1puRlVm?=
 =?utf-8?B?ZytQei91ZUFqMWRXclFpYmZXcUttYkcrM0szN011WjVKQ0ZiQ0ZEeXB6Nmtw?=
 =?utf-8?B?THd2Q3VjTmxROVFqNXZGS0V5bVZSQ2NQL1djMldsTEd3aE9jTVN0cEJnWk9h?=
 =?utf-8?B?L3UvbmxsY2ZPMk4yaThSMmJtQ0hMRy96WGJ3WUxjRkVLWWRGcktJVGtKamRa?=
 =?utf-8?B?MncvYzh5SlRVUTdlbDNrbkRrUER6b0g1QjBrOWlENFhLbWVqV1ZVNDlPQ1BV?=
 =?utf-8?B?NEp5M296ZGVQbHVWLzdWVlorNXVsaG41OG4wL20vRGlqbXhUeVJhUmw3ZDJY?=
 =?utf-8?B?RGxGek5lQWJKcEErV3lFaGFwWVprQ0NTaUZ1TEpvZFJWVEZ2R2hVejR3ZHd5?=
 =?utf-8?B?K1JoZnNnc1dUci94d2R2OTFyMncvWVM4a0hBSzNCVkw3dDd2bWYxOW12SHAx?=
 =?utf-8?B?amFmaStZY21uOUN2cy9lKzVwK2JGK3VDNC9RY0VtRXZkK2lFZThBSVFkWk8y?=
 =?utf-8?B?dmt6Zkoram1idm5IditGbUNqbWN4SnRzQzRiYUNQa013dHBwNVpYd0p4VkFL?=
 =?utf-8?B?eFhFcGZNais3MWdNaDFPbkdXU0tTcVhrdDlHWFhtU0pzbjVta04wK1EwRnVz?=
 =?utf-8?B?NWZXT3FZM3I2cjd6d2VLSHZJc0oxNGVsWnZIOFZreVI1YTFpRmFIL2JxaHZj?=
 =?utf-8?B?SG82OXJVZmhlbm9zL01SUWJCdmE0alVweHhTdnE2QzN3aTdLWWRwenVkVVly?=
 =?utf-8?B?Z0dqRVp1QUpCYVJSMGlZWmQ0MThZaTBYd2RDclNOeXRCTnJFUG4rYlJmcVRw?=
 =?utf-8?B?MXNQSm9pS2xhMFFUVUkyOGRNczdnMkRIcnhoR013UDBqemdSdUU2dGQydXk0?=
 =?utf-8?B?QXlJQndmdkNQb0NxdHI1bUdZSUhLOWNyNVhWWFlSOWtIbHFQQm1kS1ptem5T?=
 =?utf-8?B?MjdidVZsWVgvL09uRUdtd3VSUzI0YUdSZS9Pa0ljcXNxUC84WThzbE9uakk4?=
 =?utf-8?B?N0E5MHJxSklxUlRTc05tRExYVkJLdjhBVG1tRW9BZ014VjJnSkdMVlFtUmd3?=
 =?utf-8?B?aGFWRjZUUzVIRDE4cnBTdnN2am5wQ1NnTGlLZ0ZyNVFmQVNTQWZEN3hiQUZD?=
 =?utf-8?B?SGFLYUxVSjI3SWN1NmZDWUFTSERlMHMyUzJONmJ0TDRlWitJdXJCcHlDTGli?=
 =?utf-8?B?MVJFcklXVHJXS2xQdWxPdk5nSGE5ZmRYYzhRdGpxN1FheHpMRThTUGNxNlE1?=
 =?utf-8?B?cjlMZ25oWDhJajNESnJUYVZwc21DRENDZkxzSm0vQWhCbENMOE4wSnVkaTRF?=
 =?utf-8?B?YzZBRXdkYXU4NysrTlpHK0lraGpwQVBSQzJSUHJ2WHVmR0pGZlplWVZMVVR0?=
 =?utf-8?B?STB0cGRXNVVGdHdmTEZOMklqTGtjN2JBckprUlFuN1FORUViQkgvVXdDNjdE?=
 =?utf-8?B?TGpOVEgxVXZDRm9KTlNadHpkbnc3TTFSbm92dVE4NENTUFJQWXB3S00wRmp6?=
 =?utf-8?B?UUZDWWo2azJrUU8yTktZUytTY25uZzIyT3gzMWplSXlQc0JPZUZUSWRBNzZ6?=
 =?utf-8?B?YWNWaStNNlhRRFVvWXR5OHZlNlVIN3VVdW1qL3lpVGx2RXgyK01xNE5BK0Vp?=
 =?utf-8?B?d3E2bjEyN2l1bEwxSHRzZ21ySC9qN0ZXR2wxZUpFeUtxUUJURFJmcUZ1NmE5?=
 =?utf-8?Q?2TcbamOZRsN63SMELj6EySkZaIjVQkfA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6096.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDhnQVliUkxrTncyNFdsdkNuZXVDWXA3VGIzM0FMWGdRVkxFRTBDZ3BZTzdF?=
 =?utf-8?B?Z2Z4eVFIcFllVTNqODlKNHNBQTZtMld5SG0wMTZCQ0VxdTVCWW9Od2FyK3JH?=
 =?utf-8?B?MysxUjh2NXZFUWVSM1Brak40cU01Y012T1gyM0diTE8yU3BnZEMzemQwUHZt?=
 =?utf-8?B?MnpId2o0ZkZOUzNwSVRFWUM4UnFVa1dCV29lQk5KdDlYZ2U1dC92UnVDc2pT?=
 =?utf-8?B?ZnppMnVxRlduQVR4aldGd0REZm5FVTM5VnBGY3VYU29wNEppRVJtemExV0xQ?=
 =?utf-8?B?U01nQ2JWb0hOZ2ZBV1ozbExJQSsrN3B3d3k3MkRkK1JFRnExNG1wNWlFeWVQ?=
 =?utf-8?B?bmVoYmFJT2t6WlFVT3JNU3h6NHVUMHJzSFFkUERuVlFFNWQ1eGh6QnNtY0Z5?=
 =?utf-8?B?MjVIM1EwVFI5dExDVEwyV1RlSks1UVlTb1ZDK1NGNERqZlBmWFlEWlBWZnM2?=
 =?utf-8?B?c2owekRUVStHOC82WUlDQnJ4Tkw1STU1akIvY1ZuQmtKSzFYeTBWam5SZFJS?=
 =?utf-8?B?WDc2YTlRcFVoMTVKejJDUmRGMkpSWUJCTFJ0WWoyK1gwYm9OaXFQNHRpOG9M?=
 =?utf-8?B?OEhTeW1paVgrTFRLaUp1MllJZ3VmN3M5c3YxdWxuamNLNXdoZUZKdU5lclpM?=
 =?utf-8?B?dFBKVDNRUlg4ck1BeGxuZzhxanNuY2I5VHBEalhmMUUyV3J6dUM3WTBXQjUy?=
 =?utf-8?B?YlV1QUtJU05zazhTQ1I0KzNxWnNUWVhhOWxTWXdVVWtJdDVKSlRoTVY0ZGhW?=
 =?utf-8?B?NjIydUY2TlBFYTFRSG5CTCswRmZpTVdVZ0QrMzVrVHVSUUU0RnNERTNFRDcy?=
 =?utf-8?B?dkt1Qi9TeFVtalYvUXY2RzYyYlgyL1dkM09LaXBHOUxHczVaMVZiK3hKU3o5?=
 =?utf-8?B?bmY2YnZ2MVhRcm5FREF5Zk9NdHlCdE1kVFc0N0luTm1weGZybHRTYlltdHpz?=
 =?utf-8?B?RVN6OWw1VWJ4N3RDeXJ3SkcvSFFLY2wzcFJyUXpZWGNTd1EvWStZTHphdkVj?=
 =?utf-8?B?WXRqa0lwcEZQNDV1VUh4Y1hKanNUdGFuSDB1SW84SG0reFVzR24xUkhvUkFi?=
 =?utf-8?B?MSswekJWL2J4dk1DTkJVMzFuczJQbVVrMTJ5anJySTRBSGRpazhtUjg4cVg5?=
 =?utf-8?B?b05ZWEErZGRJbFFtWUJmVmdmTG5ub1ZIaWh2R21nNXRDbjFXZ21mM2dhd2Jn?=
 =?utf-8?B?SGg3c2ZvK0V5REtLa0FneFNLSjNUQkR6M0R3dENySGwyMUtFWTBFVUdtTFdT?=
 =?utf-8?B?OHlLQTM4UVBJYXZLbFQ1NXA4enA2WG5Sc0dyU1BwbDJ0ZUNFZ2hDcXdJK1dv?=
 =?utf-8?B?VEVreGd0VElmNWkxNllCbzJLYXU0SElEMXVDZ2Z2dm1ZblVhUEUzSGpPZ2l4?=
 =?utf-8?B?WjhUbVdCYTFvbFZMSUhmVSt0L0k5aG5NNFdkOThLRXpzVnhSSnViYkRQWWNU?=
 =?utf-8?B?dlpYUjh2cFhxaDhubk5ySWozMmVBWVIvTU9USUR0ZlZFLzU2QlUrTUFUZzVZ?=
 =?utf-8?B?b3B4UC9xZlgvWkFMWi8wODg0NVVtSDZ1QXBIMnNIOGdMS29BQjA5aWJ1Vklx?=
 =?utf-8?B?U2Z4eGhyRm1GWnVJVTlUKzd6NVYyWkFVbGRlUDVXZWpDZGxlVlpxYkFiSUhV?=
 =?utf-8?B?dG8rK0xYMm5zclpXSWxWYlh3bk9jaDgweU96VzNRcGJ0TWlZNFRHV3BMY0RG?=
 =?utf-8?B?TDUyQTUwRTFORWRleUZMcTRtK0RJSGtBeUxDY2E5cm54MjFqK1o5MkpyS0h0?=
 =?utf-8?B?ekROaWJnQkoyM1lSeEY0VW0vaG54MXdRUVVtWEdQd2RURm1NUnJOa1J6NWRh?=
 =?utf-8?B?SktyQ0t1cUtuUjBlUkY4RGIrMGwrZ1c5eWFqWlBsVWpNN1ZvbWJqTVplalF1?=
 =?utf-8?B?YVUxSm9hSkJNbmU0MXRxekpDV2VUQ2FkZkh2dnJKZU0zQVNYZkJWUDF5TE5F?=
 =?utf-8?B?QWkvdHV6a2dTUlZzcXVZaWZKaDB0U2NRdFc2ditORGNVeFIrMHV5RWZmWllD?=
 =?utf-8?B?bUlxQUg3dmJjU2tqQWh3R2QzaS9hOHl6blB4TDdmRnBCdnRjcVNlUm5odG5K?=
 =?utf-8?B?RVJMY2VRQUJBQkNaL3VGb0NiR2RxRWh2U2h3Nk0vUXNFUEM2WGZDTEM2cEww?=
 =?utf-8?Q?FKvgPY/ycm2a1zAct9+p+uNM+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fec0ac2-ba67-4861-0738-08de16c6e367
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6096.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:41:01.0696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9s6VTxKJGNIN5YXWT08jBC+1DQY9WR5gKvCt5E/MNDW0tIh+qeUvB+4FGQ8tw11b+VQru9jJxjD24sleBS2QbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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


On 28-10-2025 18:32, Matthew Auld wrote:
> On 28/10/2025 12:37, Thomas Hellström wrote:
>> On Tue, 2025-10-28 at 17:54 +0530, Arvind Yadav wrote:
>>> This patch series introduces support for purgeable buffer objects
>>> (BOs) in the Xe driver.
>>> This feature allows userspace applications to provide memory usage
>>> hints to the kernel,
>>> enabling more effective memory management, especially under system
>>> memory pressure.
>>>
>>> When an application no longer needs the contents of a buffer, it can
>>> mark it as DONTNEED
>>> via the DRM_XE_MADVISE ioctl. This makes the BO a candidate for
>>> purging. If the kernel
>>> experiences memory pressure, it can reclaim the backing store of
>>> these BOs,
>>> freeing up GPU memory and helping to prevent Out-Of-Memory (OOM)
>>> situations.
>>>
>>> The lifecycle of a purgeable BO is as follows:
>>>
>>> A BO starts in the default WILLNEED state.
>>> Userspace marks it as DONTNEED when its contents are discardable.
>>> Under memory pressure, the kernel may purge the BO, transitioning it
>>> to the PURGED state.
>>> Any attempt to use a purged BO (e.g., binding, mapping, or CPU
>>> access) will result in an error,
>>> signaling to the application that the contents are gone. The
>>> application can then re-validate
>>> the BO by marking it WILLNEED, at which point new backing store is
>>> allocated. To prevent data corruption,
>>> a critical safety check ensures that only non-shared buffers can be
>>> marked as purgeable.
>>
>> What happens if the bo is bound to multiple address ranges? Do we
>> require all of them to be marked purged?
Currently, purging is applied to all address ranges, even if the user 
requested it for only one. Since the DONTNEED request comes from a user, 
it's assumed user are aware that the buffer object (BO) may be used 
across other address ranges as well.
However, if preferred, we can update the logic to purge the BO only when 
all associated address ranges have explicitly requested DONTNEED. 
Otherwise, the BO will remain WILLNEED. Let me know if this approach 
works, and we will proceed with the changes.

~Arvind
>>
>> Also with i915, when someone called WILLNEED on a purged bo, there was
>> an error rather than an attempt to rebind. What's the reasoning behind
>> re-allocating backing store here? Doesn't that mean we need to keep
>> vmas around even if we purge?
>
> Yeah, IIRC in Mesa/iris it used some kind of BO pool, marking stuff as 
> DONTNEED when "freeing" to the pool, and then when something was 
> allocated again from the pool it's first marked as WILLNEED, but if it 
> was purged they would simply discard the BO and try the next available 
> BO in the pool, which is hopefully not purged. So sounds like 
> re-allocating could potentially end up with undesired behaviour where 
> it now just always re-allocates instead of trying to re-use an 
> existing non-purged BO which might already have pages ready to go.
>
>>
>> /Thomas
>>
>>>
>>> Arvind Yadav (7):
>>>    drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
>>>    drm/xe/madvise: Implement purgeable buffer object support
>>>    drm/xe/bo: Prevent purging of shared buffer objects
>>>    drm/xe/bo: Handle CPU faults on purged buffer objects
>>>    drm/xe/bo: Prevent mmap of purged buffer objects
>>>    drm/xe/vm: Prevent binding of purged buffer objects
>>>    drm/xe: Add support for querying purgeable BO states
>>>
>>> Himal Prasad Ghimiray (2):
>>>    drm/xe/uapi: Add UAPI support for purgeable buffer objects
>>>    drm/xe/uapi: Add UAPI for purgeable bo state to madvise query
>>> response
>>>
>>>   drivers/gpu/drm/xe/xe_bo.c         | 91 ++++++++++++++++++++++++++--
>>> -- 
>>>   drivers/gpu/drm/xe/xe_bo.h         | 51 +++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_bo_types.h   |  3 +
>>>   drivers/gpu/drm/xe/xe_vm.c         | 11 ++++
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 67 ++++++++++++++++++++++
>>>   include/uapi/drm/xe_drm.h          | 34 +++++++++++
>>>   6 files changed, 245 insertions(+), 12 deletions(-)
>>>
>>
>
