Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300C7C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D7F10E55C;
	Tue, 24 Jun 2025 09:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4yLAqR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A5010E55A
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750758000; x=1782294000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fuMdletKU4A8wTRi2qRWJqonxEwApKLWMWTrrzSKhWY=;
 b=E4yLAqR/NFk8T/rILL76p2Z/BIrIOXVc94uot8iWio8k6sXet6gAEoiU
 1B98K2J9M9HrYtcXjZb2MxRtYojtUonEa4yF8p90zJ+sd2Tg3dbeXiySm
 mNEmzJHaDcv44+tAe4jdqCGYTo1GVACK00l2ehCyo8y2eQEvGJ5NUHicB
 2qHEcLWfzkZ8Yi1JIR9sXfe26hrOmGPwBMGl9rm8TiY6D9E/efDSqhYPV
 7HKQl7GnZIBzkxSse6kve9VQsiqFEOHvXZZ9P5PISTZ2abtCkBvF8JchW
 rvWjVf+y4IWdVDqK5EfQ/178SZU0dR3AbxGWu4q7M1WX4HSN9Rt21UlcZ g==;
X-CSE-ConnectionGUID: 6AlQL1b8RheWoC6i7ROkbw==
X-CSE-MsgGUID: RPA3JxfZTGmSXxnvhMYNvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52858701"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52858701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:40:00 -0700
X-CSE-ConnectionGUID: F9gkoTMYRd2y5LrzvKIoSw==
X-CSE-MsgGUID: 3DG/CkFWSAydZTjpX9HCSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="156254131"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:40:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:39:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:39:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:39:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQFt8ybO7AHFFpXYq7CElvQCmNe0WtqBRWjqFz1Ba2w7ZPCB+rjTJNhVz/1j3Q2I+kHOvigpiztyNjQBHXM8baMsNx1dOo28jguWf1lJ1n5YWsCvhrX852dxkSuVJYnX8fQbGtcphT67RDpDCjTg1BToz8R96oEl+KHCP6A3vfsH2BBPF3SqDVrqdVhVQGDtKGLXngGJHDjxbdhjGnM3ea3FQvYt6ndb9h8w69p5oUxIj2PvuKeX27dcmW/2/lMqezVbwMk7lU8bJnsc+rxDoWDKk92GqMVoCqlw6bG+P5bo10kduF9lxDHycQH6Nx8kvDfuFNQFxmw0RGxMcJN1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GDtwC8NdsMXakKMb6Mi9CmN5N3xAPL7t5ZXuyceqUo=;
 b=GwqZUSmdcW76s8rCXSu+YrVcngLFx0Da3D7wcqbzSVkq+q1gAXVfoFL9mbDnp+W5CmlcpP1sJ49VHPTAEdbvDZW6WpDbsK4DfouGzIDUsllQSmyTJ48vL7Y4mWgl+5BQi5w4U7/gWIPS/w6aLbxow2hzkaKJkEG0tPyavHlirC/jsOkhokDc8j6cLqNlHG1SvSE4iI7vlJeCkp7wxJMX34hQdq8Y/KIbzRajs4FmGa7Gf7VUuTKrox7+WDa3uixNIh4LrL9QDTK2r32AXAFKbmF7ut2jc3mFXIf3slaEFTWHv7kNH/MoFRUuPCp1Nxng7xlX/jRMV4fQM5rasmVYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 09:39:56 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:39:56 +0000
Message-ID: <608b3f25-2597-4c23-9b99-c65fd57a971e@intel.com>
Date: Tue, 24 Jun 2025 15:09:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/xe/vf: Register CCS read/write contexts with
 Guc
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-4-satyanarayana.k.v.p@intel.com>
 <aFWMrPVvXmXDpzUY@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aFWMrPVvXmXDpzUY@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA1PR11MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 067dd2f5-ce3a-4898-defa-08ddb3031407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmJjMWExY2JTWndXUnhNWTlsUFZKdkhQUUFiR1hIRTd5d1hJa3p5aU9Db2t2?=
 =?utf-8?B?VE51dmtoMU5DUVd3VjdmK0hpMEdSVVRHaVhkUFp4RW4zZE5PN3A2N0NlQWl3?=
 =?utf-8?B?WFZoVEdqY0VIenB5U3VhZUM4VFA5c0s2cUM4MXgwd2QvY0l2YXFTK1ZRNFhj?=
 =?utf-8?B?eHg0djRZd085U0FEUGg3bE1vZU9xWVZxck9ITGkxcjcxZFV2OW9xbDNHUmVC?=
 =?utf-8?B?NGRVT0x5aXVqbjV0aUlHTC9yRW5oQ243eVROM3VzU1Y0aktFVTVSODdRWEs3?=
 =?utf-8?B?Vnc3dVdoT2RrRUt0c1pEUE1TZkRYZnFwdU9jNE5kSkFpYWtQbDVkWmZrSGE5?=
 =?utf-8?B?T2tUMDNvdVRUOXF1emU0RnY3bTU2b2wrc05JbGd6RDJZbmRWVHFnL1JkTTZk?=
 =?utf-8?B?cUFpQW5Xak9RT2ZHZ0JoNlE1YlZiWnNsVUU1ZUlKeHRDKytEL3lIMUYvN25a?=
 =?utf-8?B?akVtS1k2NGxFYlZVNXEvQWpVeVNRcmIwY2RpV2Z2Q2p1R2tWbkp3YWREemxL?=
 =?utf-8?B?TWZJT2JpRnhCenRFTGk2SGpBTXlVWE9uYk9zUUNaWWRWVG5waHVsMTVjYVg5?=
 =?utf-8?B?TStWc1JoclhpNGRVRlVsVklDV1Q3R3FSRVo4dnM0RVdkNjg2WGFXRVQzeTh4?=
 =?utf-8?B?VUUycHVJRitzOVoyaFdrRzNKSU9HM0FMci9JMFZpRlZSUWoySzB1YUx6YmFt?=
 =?utf-8?B?bHVyNk5kL2tYTDNYSW1tNEpublRSRGpyb3pEVFBUU3ZnUjhTa0FPMk1vWVFl?=
 =?utf-8?B?S1pnVE0yL0wycFJaQUwyTkxOOUowZ0hVTllOS2RBV0UrenlWSHdIcUdQUGhD?=
 =?utf-8?B?NnZlZmFzZVdLdUpKT3BZZEJ4dlBOWjhUR1crVVYzcmpKdGNReWFINlppaEVx?=
 =?utf-8?B?WE1OYm52eGJyUHJhWC9MUGJKUFFYVjVwVTVSbWcyNHptRXFldVBlWG1OSEho?=
 =?utf-8?B?c1RITVNSYUJtVVJrSHRzaEdpeE5uRVpHdkFhY1Z0SU5MekI1MVAyMThaM2xQ?=
 =?utf-8?B?Z1JSbHFMRGZqd0FuR2pWOG5mS0FMZ3VkWVEycGh2dkhqV1lkcHpUWDRITE5U?=
 =?utf-8?B?TzUyZkNBSFVGYll1UnhnMlFuOWYxcU0rVDFJY2FVbHZyNmtOcUhzV056U2tX?=
 =?utf-8?B?akR2aEZTUnRFR2NiTDF3cUdGK3J4Nm5sTXVabitwMWxyQng4OTJIa1hHYndX?=
 =?utf-8?B?Q3ZXKzRJOGJyNFhYdjB2Sk5NRzB0SEY3WE5uaW80ZDBqWnJMKy9UVWZaMlNC?=
 =?utf-8?B?VzFnaFNESFhHM3JIWEh2UU50Nm9zNzlaNXFOZkxWUmhIeDJheExZTkQ0K0g0?=
 =?utf-8?B?dUxaL3RHZ0NUQW5jV0RhazBxNXVmM2d6dnk5WlJNdm9rdnpIczdhN3NuUHZw?=
 =?utf-8?B?TmtCN01FUjlRajhkT1F4QWJWM0tmRE92bGdXbG1JY1ZIWjk4OVhJZ3ArQ0xY?=
 =?utf-8?B?ZFIrOUVVMEM0MXlVY2RLMHZocEwxUEprQzBBaThsSmtJT0NoVnBpU2EwaEc4?=
 =?utf-8?B?azV4a3dSM3ZEOUJEaXpTMlFqWmwwRllnZDQ2cTQzTGl6bnpyaWxBdHhIZUNZ?=
 =?utf-8?B?bVRCUjc4dmMwcytIRmFjUWt5VElYZCtLUnZud2FBd0FzZzlQSEkzOWFuZjJH?=
 =?utf-8?B?b21HaXpiRlZxTzk0NTdZdTdqdmZIUHNNa1VOdFFoVmN3M1NXMmNsaE1RMWRU?=
 =?utf-8?B?aDZXa1BJODNyS2NOdldyNXI0Zk9tRUhyNmdpeXdmbHVIVnRLc3p2djJjcUNR?=
 =?utf-8?B?Szd1dXVhQ1FTUDJwQUl4N0pEOTlGQzBpUXJTVkRwWE1ZUEpLOEtrUEJwdVJK?=
 =?utf-8?B?QjlUcGdoNWNBQkU3LzlFYjRuUmlxZlVVaXRaQ1FyUHVWaHVnN2h0cHYzZ3Uv?=
 =?utf-8?B?YU9vWVFHWkRla1lDejVWQWV2elFPRUp3K1FDUW5iUjRUcmg2ZUtZbytaUmZ4?=
 =?utf-8?Q?3aGMJNaAOBc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9tY0hLYytJVG5VN2tRazJ3ZFp1dm0ra2RlR003cytRKzRINnlmOFV1aGVD?=
 =?utf-8?B?T2xScFFYVUZheThkNkpQSkpwZStQUm1UK1p0SUFTWTZLMHQ4RlhzeTBuakVt?=
 =?utf-8?B?RWhzRTRGeVRGUHlTVFh5UGxHUlVMcklKdTROUVlFTFFyUjNBSXBtZ3ZQeEVy?=
 =?utf-8?B?dWkrTW9yYmRLUHgxdWFMOUJ0dnVWbFBraHJIRzR0Qjl0YVd4dzBUSXpKYVdG?=
 =?utf-8?B?QjBlVjNobkJGajhEbW9xaEZLeTRTR1hUZGVaYmp1aDRteUFZeXJHRzZYRTJN?=
 =?utf-8?B?REdQdDhodHlkU1dMSERhV09rRGhYWGIxbzZCWUVlZHd6Q21TSHdGYXdFUHlj?=
 =?utf-8?B?YVZQZjFXVmJ0M3FQZDNwSVNXMVM2bXRTYVRUN1BaeU83L0NySS9BSjdsdHVS?=
 =?utf-8?B?OFlML2pCWStuYXdwR2JCZVpHcUgzQ1lrdFRZT2dkYmtPZUl2VjFaOUtwejNp?=
 =?utf-8?B?SVMyR29KeCtHb0Zibmt1TXZoQ3RjSEVWTjZZUWpwamZUdVdzTXF6RVc0UWlX?=
 =?utf-8?B?dCs2bnkySk8xNHdEODNLRkFRNEdFK2h6Z21uRlpaT2VPMWYwUFZ0dkVjR2tn?=
 =?utf-8?B?d1AyNlFHV21PeVZ1T1c3ZDc2ZEkzbU1OdVlySzBVTHdZZWs4VzhtTVpSeUd1?=
 =?utf-8?B?RVA4Qm55ZlBRazVmNFNOODdZU1kzaTFTL2NRcnNRazUvQ0xobjFOY0Q3RXRS?=
 =?utf-8?B?d3ZPNGpINS9mL1M5VmlrK1l2dkU4dFRQUUNBeThieWhJMFpMZkZrSElRZzcz?=
 =?utf-8?B?K1RiaEZic1RQRFdxcW4xOE9HVVpPdFcrYStNYWxJL2VzR2FrWHZJZEhwMm9s?=
 =?utf-8?B?Q3ZUZmRod2UyUERhS2pkeS9WT2c1Wk00TGpNVy9NblVhNnVuRWswbktyZWVx?=
 =?utf-8?B?bDdiV1lCTXhvbFg2enJoR0JVeFhDQ3lKYVJPWDlyRHpuWkZHQkpEeFNqcVlx?=
 =?utf-8?B?d2lxVWxudUpnK0NZWEI4Sm0vbDE5cEZyQVhzaXZ0QWdiTkJEZmpMNEY4a0Jm?=
 =?utf-8?B?ZkNBN3ZOek4yZ1g1U3VZWFI0TVZaN2ZBWFQ0UXVkMnZseWJEN2tYaFJHVkFV?=
 =?utf-8?B?Vm1zM3V0SGN0VkwvaFpJQ3RRSk9jajJTRnA4RUN4N2x3LzFvVVo5TGpsOUJO?=
 =?utf-8?B?OWR6OU8zUEdxMzlTT2p3UjlxWkhoUm8rY1llTWxKK21SVUNlaGE5K1ZIMG91?=
 =?utf-8?B?Z1BpM0x0cm95cDlmeHFnYnNpb2swazFqcklhZTNoY1ljUjZFWjBjZ2dLQ3FS?=
 =?utf-8?B?NGdPdlZ4LzJsT09pNHEzendTbVZKODgrdEdNQURHZjN6cWF3dE5tWVFWZFpN?=
 =?utf-8?B?aHFwYmRNTjRpVjVmNEZYcU9zN1JsQ2hRaGgrb29sV09JenJwaUhJR3JtN0Ry?=
 =?utf-8?B?MktLU3RrMk5HZ01SY2p0RHNzQ0ZidkRZYXlmQUpWcFVPQm9kTHFkQlBubmtq?=
 =?utf-8?B?ZHVHVjNURzNGVHo4cXk3eDBDTVJvOC9INlYzaGRmM1dMZkNKeXVibVpBVnRW?=
 =?utf-8?B?cnJEcTlMbEl3bThscy9EWS85bXZud3RyRCtkMmhsckNoR293TGJLWWtyZTNG?=
 =?utf-8?B?RkNEaXpnaGRVdWIyakFVZkdYeWc4ZnFEQXRtOHdsYlJ0VUdqMXZ6Zkpud1Ni?=
 =?utf-8?B?aDZhMWJaWCt5Tkd1QzFyc1Z3VHFJaTJtb2NKVlFIekRsU3kxMnI1WkFnM3JI?=
 =?utf-8?B?aU40WTFlNVY1SE1Kd3JPZ0ZRZHFDeGdiaWlRR2k4K3dRdEx5S1oxYkR2NFV6?=
 =?utf-8?B?N0tudUdRSURHQ0VwQ0VNMWp3cWpHQzlQd0VLaU5JRGVjQTMrQi9uT2NMRDQy?=
 =?utf-8?B?TWVvZHVpMEluL1c3TDdNZTYxcWhFSVdNUUprejg3ekRwOUM2aFZnNnpnZWtI?=
 =?utf-8?B?QWNQcUowbzVEWUE2b1dKdTlVV08zeWY3Y0kxbVNWUGVYdGwxVElzdWZQalg5?=
 =?utf-8?B?NGxUYlFVeHROT3FGLy9VYnJheGN5LzZsSEVYV3lCZWt3U0xPczhBOWJFOENm?=
 =?utf-8?B?MjRNd2gvcE9ucUFoTjhqUnZucGNHMCt2NlJIYTdxQytycHZ2empBQVpvMGZm?=
 =?utf-8?B?c0xWeEtOQkJDRUFIMTlZS0ZIOHBYUE1GQ29wSkxIWEZnSnpHSERERDJUSFU1?=
 =?utf-8?B?aVV3ditmdmlRK0FTOU9NVGpEbm5PN0ZYVUt3cFpkQnhpRG13enFNQ1RtZzNS?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 067dd2f5-ce3a-4898-defa-08ddb3031407
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:39:56.2313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJBQz336kRgC7IapC2UjQgRH2luF0P8lKehnL+WglCKl4KEKW4JEkD4pM9b3L9VXOlE1akWgXEjfRJoWrFSrLZCce2Z5mhuu6s/Ufcyzgew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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


On 20-06-2025 22:00, Matthew Brost wrote:
> On Thu, Jun 19, 2025 at 01:34:59PM +0530, Satyanarayana K V P wrote:
>> Register read write contexts with newly added flags with GUC and
>> enable the context immediately after registration.
>> Re-register the context with Guc when resuming from runtime suspend as
>> soft reset is applied to Guc during xe_pm_runtime_resume().
>> Make Ring head=tail while unbinding device to avoid issues with VF pause
>> after device is unbinded.
>>
>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>>
>> V7 -> V8:
>> -None.
>>
>> V6 -> V7:
>> - Fixed review comments (Matthew Brost).
>> - Replaced xe_tile_migrate_exec_queue() with xe_migrate_exec_queue() as per
>> review comments (Matthew Brost).
>>
>> V5 -> V6:
>> - None
>>
>> V4 -> V5:
>> - Fixed review comments (Matthew Brost).
>>
>> V3 -> V4:
>> - Fixed issues reported by patchworks.
>>
>> V2 -> V3:
>> - Made xe_migrate structure private as per review comments.
>> - Created new xe_migrate functions to get lrc and exec_queue.
>>
>> V1 -> V2:
>> - Fixed review comments.
>> ---
>>   drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c   | 34 +++++++++-
>>   drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
>>   drivers/gpu/drm/xe/xe_migrate.c      | 35 +++++++----
>>   drivers/gpu/drm/xe/xe_migrate.h      |  4 +-
>>   drivers/gpu/drm/xe/xe_pm.c           |  4 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 93 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c           |  6 +-
>>   9 files changed, 163 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> index 6f57578b07cb..ca9f999d38d1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>> @@ -45,6 +45,11 @@
>>   #define GUC_MAX_ENGINE_CLASSES		16
>>   #define GUC_MAX_INSTANCES_PER_CLASS	32
>>   
>> +#define GUC_CONTEXT_NORMAL			0
>> +#define GUC_CONTEXT_COMPRESSION_SAVE		1
>> +#define GUC_CONTEXT_COMPRESSION_RESTORE	2
>> +#define GUC_CONTEXT_COUNT			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
>> +
>>   /* Helper for context registration H2G */
>>   struct guc_ctxt_registration_info {
>>   	u32 flags;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index df7a5a4eec74..f17a63ea06e9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -542,7 +542,7 @@ static void __register_exec_queue(struct xe_guc *guc,
>>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>   }
>>   
>> -static void register_exec_queue(struct xe_exec_queue *q)
>> +static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>>   {
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>>   	struct xe_device *xe = guc_to_xe(guc);
>> @@ -550,6 +550,7 @@ static void register_exec_queue(struct xe_exec_queue *q)
>>   	struct guc_ctxt_registration_info info;
>>   
>>   	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
>> +	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
>>   
>>   	memset(&info, 0, sizeof(info));
>>   	info.context_idx = q->guc->id;
>> @@ -559,6 +560,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
>>   	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
>>   	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>>   
>> +	if (ctx_type != GUC_CONTEXT_NORMAL)
>> +		info.flags |= BIT(ctx_type);
>> +
>>   	if (xe_exec_queue_is_parallel(q)) {
>>   		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>>   		struct iosys_map map = xe_lrc_parallel_map(lrc);
>> @@ -761,7 +765,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>   
>>   	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>>   		if (!exec_queue_registered(q))
>> -			register_exec_queue(q);
>> +			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>>   		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>>   			q->ring_ops->emit_job(job);
>>   		submit_exec_queue(q);
>> @@ -2366,6 +2370,32 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>>   	xe_guc_exec_queue_snapshot_free(snapshot);
>>   }
>>   
>> +/**
>> + * xe_guc_register_exec_queue - Register exec queue for a given context type.
>> + * @q - Execution queue
>> + * @ctx_type - Type of the context
>> + *
>> + * This function registers the execution queue with the guc. Special context
>> + * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
>> + * are only applicable for IGPU and in the VF.
>> + * Submits the execution queue to GUC after registering it.
>> + *
>> + * Returns - None.
>> + */
>> +void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>> +{
>> +	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +	xe_assert(xe, !IS_DGFX(xe));
>> +	xe_assert(xe, (ctx_type > GUC_CONTEXT_NORMAL &&
>> +		       ctx_type < GUC_CONTEXT_COUNT));
>> +
>> +	register_exec_queue(q, ctx_type);
>> +	enable_scheduling(q);
>> +}
>> +
>>   /**
>>    * xe_guc_submit_print - GuC Submit Print.
>>    * @guc: GuC.
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
>> index 9b71a986c6ca..8f64e799283b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>>   void
>>   xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>>   void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>> +void xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index c730b34071ad..a90c5ecbd8c0 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -84,19 +84,6 @@ struct xe_migrate {
>>    */
>>   #define MAX_PTE_PER_SDI 0x1FE
>>   
>> -/**
>> - * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
>> - * @tile: The tile.
>> - *
>> - * Returns the default migrate exec queue of this tile.
>> - *
>> - * Return: The default migrate exec queue
>> - */
>> -struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
>> -{
>> -	return tile->migrate->q;
>> -}
>> -
>>   static void xe_migrate_fini(void *arg)
>>   {
>>   	struct xe_migrate *m = arg;
>> @@ -1070,6 +1057,28 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_get_migrate_lrc() - Get the LRC from migrate context.
>> + * @migrate: Migrate context.
>> + *
>> + * Return: Pointer to LRC on success, error on failure
>> + */
>> +struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>> +{
>> +	return migrate->q->lrc[0];
>> +}
>> +
>> +/**
>> + * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
>> + * @migrate: Migrate context.
>> + *
>> + * Return: Pointer to execution queue on success, error on failure
>> + */
>> +struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
>> +{
>> +	return migrate->q;
>> +}
>> +
>>   static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>>   				 u32 size, u32 pitch)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>> index 96b0449e7edb..3754d9e6150f 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>> @@ -118,6 +118,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>>   			   struct xe_bo *src_bo,
>>   			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>>   
>> +struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
>> +struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
>>   int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>   			     unsigned long offset, void *buf, int len,
>>   			     int write);
>> @@ -138,6 +140,4 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>>   			   struct xe_migrate_pt_update *pt_update);
>>   
>>   void xe_migrate_wait(struct xe_migrate *m);
>> -
>> -struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 26e95460af87..6c32412126d7 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_irq.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pxp.h"
>> +#include "xe_sriov_vf_ccs.h"
>>   #include "xe_trace.h"
>>   #include "xe_wa.h"
>>   
>> @@ -546,6 +547,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   
>>   	xe_pxp_pm_resume(xe->pxp);
>>   
>> +	if (IS_SRIOV_VF(xe))
>> +		xe_sriov_vf_ccs_register_context(xe);
>> +
>>   out:
>>   	xe_rpm_lockmap_release(xe);
>>   	xe_pm_write_callback_task(xe, NULL);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 242a3da1ef27..e4ca34af05fa 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -8,6 +8,9 @@
>>   #include "xe_bb.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>> +#include "xe_exec_queue_types.h"
>> +#include "xe_guc_submit.h"
>> +#include "xe_lrc.h"
>>   #include "xe_migrate.h"
>>   #include "xe_sa.h"
>>   #include "xe_sriov_printk.h"
>> @@ -163,6 +166,86 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>>   	return 0;
>>   }
>>   
>> +static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>> +{
>> +	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
>> +	u32 addr = ctx->mem.ccs_bb_pool->gpu_addr;
>> +	u32 dw[10], i = 0;
>> +
>> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
>> +	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
>> +	dw[i++] = addr;
>> +	dw[i++] = 0;
>> +	dw[i++] = MI_NOOP;
> You can drop this NOOP or you need to add another one. The LRC tail must
> QW aligned per bspec 46043.
Added another NOOP.
>> +
>> +	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
>> +}
>> +
>> +static int register_save_restore_context(struct xe_migrate *m,
>> +					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>> +{
>> +	int err = -EINVAL;
>> +	int ctx_type;
>> +
>> +	switch (ctx_id) {
>> +	case XE_SRIOV_VF_CCS_READ_CTX:
>> +		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
>> +		break;
>> +	case XE_SRIOV_VF_CCS_WRITE_CTX:
>> +		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
>> +		break;
>> +	default:
>> +		return err;
>> +	}
>> +
>> +	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
>> + * @xe: the &xe_device to register contexts on.
>> + *
>> + * This function registers read and write contexts with Guc. Re-registration
>> + * is needed whenever resuming from pm runtime suspend.
>> + *
>> + * Return: 0 on success. Negative error code on failure.
>> + */
>> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>> +{
>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> +	struct xe_tile_vf_ccs *ctx;
>> +	struct xe_tile *tile;
>> +	int tile_id;
>> +	int err;
>> +
>> +	if (!IS_VF_CCS_READY(xe))
>> +		return 0;
>> +
>> +	for_each_tile(tile, xe, tile_id) {
> Again prefer xe_device_get_root_tile over loop as mentioned in patch 1,
> 2.
>
> Matt

Fixed in new version.

-Satya.

>> +		for_each_ccs_rw_ctx(ctx_id) {
>> +			ctx = &tile->sriov.vf.ccs[ctx_id];
>> +			err = register_save_restore_context(ctx->migrate, ctx_id);
>> +			if (err)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static void xe_sriov_vf_ccs_fini(void *arg)
>> +{
>> +	struct xe_tile_vf_ccs *ctx = arg;
>> +	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
>> +
>> +	/*
>> +	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
>> +	 * submits this context to HW on VF pause after unbinding device.
>> +	 */
>> +	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
>> +}
>> +
>>   /**
>>    * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
>>    * @xe: the &xe_device to start recovery on
>> @@ -199,6 +282,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   			err = alloc_bb_pool(tile, ctx);
>>   			if (err)
>>   				goto err_ret;
>> +
>> +			ccs_rw_update_ring(ctx);
>> +
>> +			err = register_save_restore_context(ctx->migrate, ctx_id);
>> +			if (err)
>> +				goto err_ret;
>> +
>> +			err = devm_add_action_or_reset(xe->drm.dev,
>> +						       xe_sriov_vf_ccs_fini,
>> +						       ctx);
>>   		}
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> index 5d5e4bd25904..1f1baf685fec 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> @@ -12,5 +12,6 @@ struct xe_bo;
>>   int xe_sriov_vf_ccs_init(struct xe_device *xe);
>>   int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>>   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 04d1a43b81e3..8f1a258912ea 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -953,7 +953,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
>>   	for_each_tile(tile, vm->xe, id) {
>>   		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>>   		vops.pt_update_ops[tile->id].q =
>> -			xe_tile_migrate_exec_queue(tile);
>> +			xe_migrate_exec_queue(tile->migrate);
>>   	}
>>   
>>   	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
>> @@ -1043,7 +1043,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
>>   	for_each_tile(tile, vm->xe, id) {
>>   		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>>   		vops.pt_update_ops[tile->id].q =
>> -			xe_tile_migrate_exec_queue(tile);
>> +			xe_migrate_exec_queue(tile->migrate);
>>   	}
>>   
>>   	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
>> @@ -1126,7 +1126,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
>>   	for_each_tile(tile, vm->xe, id) {
>>   		vops.pt_update_ops[id].wait_vm_bookkeep = true;
>>   		vops.pt_update_ops[tile->id].q =
>> -			xe_tile_migrate_exec_queue(tile);
>> +			xe_migrate_exec_queue(tile->migrate);
>>   	}
>>   
>>   	err = xe_vm_ops_add_range_unbind(&vops, range);
>> -- 
>> 2.43.0
>>
