Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC35C19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 01:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5644F10E8A3;
	Thu,  6 Mar 2025 01:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARDnluIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4DB10E892
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 01:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741225631; x=1772761631;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wjj9ZIDA/ulIasK/RMQX60GWmaxf3DThsDaEIZc9Yes=;
 b=ARDnluIs1hyXcueRXStQApguIpxZEpZyfnXXI5/w/ZlE/RxNKPIwauOg
 AXoqanSncOAAFXoPYHjYnxh+2I6ESTNlzTTmThTbGkqxRJukljbMD4Ad7
 GFw6BkF0TUrJq0H20aqE6ug5rx9Y3K+AkG0wf346g3nmecRwdALaDen27
 Bwuu6vJLPuo9OIxwE8KoSZjnQ7UCYclwQSfx3yHXtS9e2D6LvV1ukWUbJ
 OITrGOF0/kEHAltiG4enf8fkhNLkxZbP9tg8/MwoFiVrZT1oamuoadKIy
 MYWIl/mjNjbal3B5gmYBJ1AGBiwg2gzHXnCMLr9rnAjT4A4AkkJcYzM4y w==;
X-CSE-ConnectionGUID: 5L/siO+mSzu705yF76A3yA==
X-CSE-MsgGUID: I2oNou5gQu+AAQVeRjIflQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45993244"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="45993244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:47:10 -0800
X-CSE-ConnectionGUID: R50l5Rq2Qz+7PuJbxOi0Tw==
X-CSE-MsgGUID: ZKN5t90ER+GSTWuFnDOafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149797814"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 17:47:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 17:47:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Mar 2025 17:47:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 17:47:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPxrxOpAJxEDFZRTWXy1QTSO/PvZy1BmhSCZcDnEcxh74RFEOPCClyW7uQ7QsckZwfDpJACUuCwCY417Qc8tuuyahR/1uL45YycqFpMiRi2/Jo/6Sk2bg9G+IvVTj3iZq6fvuXVbnyMkz1ItJxMjaxISEnDypHgFndxw/Vu8GqYpIRfkalf8KxifnuDrXk+LdFM740rDr3XRa4U/JEHkTrm0edLPGZ3j/lykwGYNO1N8pV7TZUD32l+73XFdMxyXuA+a9+OhXX0F5hMcu72O6CGmtJvFeiOveCfC+dgbJkmjN8jL6vdYj4FpPYXdwE1ldP9fIakazFQd0p77COXG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skMNDZvrhCLhSNyCxMuqdnw//3PZJRYrSN2SIP9Er1I=;
 b=tc3ZM7iEflWcTs+qOGE6KnBv3CVtttWIupy2bA00ZHC76gbf5AqWNP+BC6u0hl66BGfLWaEADrM8G7O3Y24fmbNWXJQIb8luPfwUaONI3kLyBgRDpHJlTovbGTCKJvDN8Z+uOrs1grY2yJKpIS48+QFsyC0ft69jQRZ71/vRCk9ggIgBWKDSTx1AKteP43VDIfctiB4CbBafzIrf7UhKVQzBjw/Pwdhh6j9D3ojs+Z6W/VTaIMgEu/2c3IRLiSGOHxQJ/ebjrN9es3Uvr7JNN0nYnjsinD26gfP4um2AsFNvFXKCH1AvjJux4Eu2rxlxrzgKUoGMXzw8bUwl2KuJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ1PR11MB6202.namprd11.prod.outlook.com (2603:10b6:a03:45b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 01:47:04 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 01:47:04 +0000
Message-ID: <2f945a38-295d-4dfa-ada0-42c045ead226@intel.com>
Date: Wed, 5 Mar 2025 17:47:02 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250213000220.3510885-1-vinay.belgaumkar@intel.com>
 <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <45qgg5bemip4eihjl6bpen5hbi7babw2itp66q3gjmej2lvs4z@gg5bp37gcweo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0174.namprd05.prod.outlook.com
 (2603:10b6:a03:339::29) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ1PR11MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6904d931-a429-4a0d-7f2f-08dd5c50cbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkU5QUFpSkRmMWwvWUJmZ0w3d1BaaklmUVVWUHQ0TitReWR5VC9hTHB4MDc2?=
 =?utf-8?B?MWp0ZDN2OFMrNHVjSXZ0NWN6YkNzNWNteGJBemM1akhJL25WTGRaa3JyWldx?=
 =?utf-8?B?Q1JlUTFRK0dpa2ZxU0tXYmIxTmtiV3l4TGdmOWpLdVNzbVVtaEJRYkd1SkdG?=
 =?utf-8?B?Wmd3MUVzNlNvdVgwaG9BdkxJUzI0Zk83emtUVWNQS2JiQXRxTEV4akRvb2w0?=
 =?utf-8?B?OUZPbkh0LzJMTlNKMFFSaWlITmU4TzZFUTc0K3ZCZUQ5WlBDb2RaTHROVXlT?=
 =?utf-8?B?K0NKUG1rczJwd3JlLzN0a1E2Nkg1cFMwTXZNMEsySlVHOTlGSi9BRzlONHZQ?=
 =?utf-8?B?T1FwTUk0YjR3RmYvQm90TXJQejdTelhBa0tjSTZnLzdoQk9hZit2dTRlYXRp?=
 =?utf-8?B?OHRLMk5sN08zSnEzdUZhaW00ZXBQTEQzTlg5UzlRNnJReEsvVFVxNU1iK2xN?=
 =?utf-8?B?YUJnampCWXlvVVVaUWZZL1JNMFVJVDduM05DSk5KKzdRdFZHeTRYZVR2VTRp?=
 =?utf-8?B?TVJBZEYyUXRxWVRvc0grdDdaVFQ2Z3FWaDZweHVNeDE3eWpqT1hCV1lXRzBk?=
 =?utf-8?B?NDh6RlhvbzM2cGNvM2ZSU1JBRFJPYkFVcWxuanM1aEptOUJkL0cvdHNvWTVK?=
 =?utf-8?B?MnhESDNMbWlLQzY1K3ZBKzhVaU5OVlZYQlpzWVNKb1dCczhRMXhHZ0x6TDVa?=
 =?utf-8?B?Wk82ZkZJem9MYzJSUjNrVU82VmIrR2xBYU4raGFNRlNoQ1dLYzlDWFFQRFBq?=
 =?utf-8?B?V21YS2t5RzQ5UHlicW1vNFp6NXEzZHoxbk1LUm5vRWFKMTg3clBpRGc4RTVU?=
 =?utf-8?B?akhRWDAxM0tDWXZmRjQxMEcybXR3NzJWSlBtcTNRcDY5TTBmblEzUkZMNHg3?=
 =?utf-8?B?aXFlcU9kaG5QV2dXdGRWR0FvYkpFRk5nZTNzVk5RWWpUQmhraitISW82bURR?=
 =?utf-8?B?QWRlSWlIQXh0WUdHblVPVkhnL0VrNVk1V3dHN1h0TUhNM1BjcnVWbTJCYjFF?=
 =?utf-8?B?VGx3bVNMT0YzZzd6ZlpJcDZiYldOYmZ3L0Uxemt3QnlScUcxZEhlTU5JclVY?=
 =?utf-8?B?Z0QvVDdGckRRVXlkSkpPeWxEemxsQ0JndjBOdU14eDJMWk9CcSs1d1UvbEtK?=
 =?utf-8?B?TFQ1QUVVdUpseEVEbU5VbmRIdk1Qd3crTFJLQ2JzcVpFMy9rWjgvczZmdlpj?=
 =?utf-8?B?d1Fib0lGV1FwL0NnVWJoajZoWE54Z3RhbC9rb2tzWWlWTjJINlJDSjZOb3py?=
 =?utf-8?B?YWJkL3lSbWhNeUJGejB4ZE9WcXEzVnhWZ2RSUk5aQmJUeFgzajhhZzRiN2Rl?=
 =?utf-8?B?WmZMYXZLeGRiODBWWnhCNUZ3ZU9lTjlrMDVacGxhbHFOcXpJRHk0NzhVd3RC?=
 =?utf-8?B?ZWtjczJOQkJCSml1U0NKVXFPL2JoZ2NwR2grRW5QQkZUZmlFMXNPS3FvZUN1?=
 =?utf-8?B?L2NrbS9SSFVTT3lGUGlHQW90N2RFU28xaDYvQjAxcTVuODhudFFzakJHN1Iz?=
 =?utf-8?B?c1dtbmpxTkZrUkFja1ZST2tsdncxSzhxTnVScmNMcGNGREVyTXBkcExyK1pz?=
 =?utf-8?B?bHpLbjZJdFQwQnFOQjFmMmZ1dWNJczBXUGphZGx1YkJWWUxBVnlnem90UkxN?=
 =?utf-8?B?ZVRjb3RleWpsZHdiejAzbjh1U2ZwRUdubytPRUtYRnRJWGZOcmRRZldsWlZ3?=
 =?utf-8?B?cTRaVzJwQ01TR3UwV3NDRk1CV1FWcythK1FnOHlTbzFhY2l3cnVzQ1FKUGJ3?=
 =?utf-8?B?czBWZ0tuZ3g0emlwV3QvTHNpWUcvNFl2UHJqMldDQXNOZ21qRGc1OU14NFN1?=
 =?utf-8?B?K3BPS05Ecjc1Q3hoNVRZSDBkOE94QzN6cGxoWmRuVEdJcDhqWGpwQTZzeTR6?=
 =?utf-8?Q?cQ1QsefpXZmBk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1Z2bkVmbHZqN2p1Y3pXUndsSmM1bG83Um5YbXg5QWhuaHBJVUdJVFRtN1ky?=
 =?utf-8?B?VG9kUkVRN3JDcThRN1NGcVVwYWovdVBnVnV1R0tqemxKSHZzZTc2dUZhUkxK?=
 =?utf-8?B?MFN0SVNiNWkxWHBBdGpnbGZ6NGVkMWM2WjVqMWRIampzd1RtOWxhTW9iTVJC?=
 =?utf-8?B?bS9sMmE1R3NjR0w3VVNXVG1DM2oxSnVsRHlObDFSeVZER2kwU1JXUm1iTkg4?=
 =?utf-8?B?ZGwyckt6c3BnUWhNYkt3dDF4TG5CTnZyaFhnVU4rS0pQeCtmUzRCbVdyUVhG?=
 =?utf-8?B?TG5BNzRRVXkrbkUzdENpQlphRjJENnBYZ0xOSGJidHJDU25CVGZBK1ArZEpO?=
 =?utf-8?B?cG9JSGg5NXF4aEk4WVllKzVKOGFmQ2oxbThYUm1YU1V5MHcwM2JUdDAxSWo5?=
 =?utf-8?B?VEl0Wkc2VzIzVEhydmRBQjZrRDJhVTcyeVkzZ21PTEliMFBGTHVmZGNHK3N5?=
 =?utf-8?B?b1VETkRFUHYwWkJmQ0VKT3RxUHJIZnJyTkdjcy9mQXJKbnduN3plZi91M1gy?=
 =?utf-8?B?cXhhVFNKYjVTTERoYzBXMUlrMXF0SmNLY1c5eWEvU3hDc0lJeDlLYTZ2NXRJ?=
 =?utf-8?B?cHZVMVErdUVXcFdoV3UvdGU4Q3NmTTE0MkxzKzhPRFdXdHgvZnF1djZWYTFk?=
 =?utf-8?B?Wmg4N1BudTR2VHVTRHg3Qk1rak45K1lQeVJMMXRFbTdGYnJ2VVBycTBRTUhr?=
 =?utf-8?B?S21lOGxVYVJyZkpvN0djQzY3L2loUWZsYjdPS0RyZDlZbkcxbGticFpmVzQv?=
 =?utf-8?B?eXViNUo3Zkg1bUdNaHFNL0U5andDRlR1TEpnZnBRdVBjeTVIemJodmpZYUlH?=
 =?utf-8?B?UGw0a3J5Vm9kdUpWWWJCQXdvbjBpaHZPZURTb0diTUt3ZHllZHFyWDNMdWFv?=
 =?utf-8?B?elJDRERlQzFlTElhOU8xa1JWRitBNjIzOUhSTytjbXhsWUQwYTc1cExKTFJC?=
 =?utf-8?B?S3lrbjF1bHJ1UEdOZFd3NHVVelowdlh5RTVWd2lnUFg3N2E1a0ZHT3pVL1VT?=
 =?utf-8?B?RlRLbTVmMDFKQzl5RnlHYzVhV0JRZFBTaHVhejJhQzNhSUt2SzZ2OS9zdlN1?=
 =?utf-8?B?ejY4Vyt4YlcxejVqUFZuS0t3M0VOeVVCcVlEYTJvL0h3L3RVN0dyR0lSZVhr?=
 =?utf-8?B?VmxaTis0eTRNMlJKQUt0Y1M0Uis1eWxVei9wSjEvNW1sRmVPV21MOUdKdjM4?=
 =?utf-8?B?Tmt3d2s4bmF5MUptaXdoZG9rakVrVEJRSWpTakxxdG9yZW41dTBrbXM5WVpr?=
 =?utf-8?B?Q2h0RTBXdnV2TGNxZXNMZjY1a0tCWHNYMFdjYWgybFgrbS9Id2lET1BKek05?=
 =?utf-8?B?MHZJZTVLdE5BQ0lkZkJDd1ROS2M2UkR5L0xHQUlMZXF2ZlkvVS9LOTYwTUlK?=
 =?utf-8?B?dzc2SW1uVCtjOWsyZ0diamRlQ2JYTFJxeEFxMjlpWDEwUERKNXF5TngxZFNj?=
 =?utf-8?B?SlRGb0pqWjRLYmtESG12VlJQUkl0V1kwbDU1c0twZkpzZ0xPc0x2UXY4SkdB?=
 =?utf-8?B?SVFFbmoyY3lpY3IrN1p2ejFoMFZzZ0hXY2VGdEdBWC84M3gvaWQraGJLMEZr?=
 =?utf-8?B?Ui8vbFZxM3ZRUTBKL0plMTVYa1J0NEZJRTJFUFVkYmdJOExIUzNXS2t5dFVx?=
 =?utf-8?B?ZWVYdWo3YitRdnpWVHBZMjdTNTUzY3ZKNFVBZzEzQmFxckZ3S3p1VE96SlFo?=
 =?utf-8?B?VmtUaHBvV3lMRFQ1ZkFkclZrYVBNemdWRnI5N05PSTZyK1VmZ1VMamFXL3R3?=
 =?utf-8?B?UGRnVGhubjRDYU5vOE9Sa2JPc25ZeEdHMWpMdHViaFVKZ3FTQ1d5RDBERXdp?=
 =?utf-8?B?UDhpQ2NLSmsrcDJyV0ZhaXNNV1M1dU54RStUUjNxVDdHc1Z1bnJNY2lrbUht?=
 =?utf-8?B?L2tsb2h4eUg1NSswNmQwTjViUVdzendNOHRLdVZkd2VWMDJnMXZMQU1DMmQy?=
 =?utf-8?B?SEJrVnMxWHJjUFcyZ0xKa2VEWTNGR3hHUHNmMFpMSVNKcUh2dXJZcWEzWVNi?=
 =?utf-8?B?TE5TcHBiK1k4Z1VXejVSTGw5cTlSSU1xVitMTlZDUXUrUGxza09mc2NlOGlE?=
 =?utf-8?B?MjUxbjlHMTB2b2JINzZhc2ZRQkNyZytidzNWcWRYMVJFZmhnTVZKbS93SFBL?=
 =?utf-8?B?L0hMRzljN0FrQ0ZLMzA1R20weHY2VUI2MTQrbi85WE41cmZEVmNESnloRS9r?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6904d931-a429-4a0d-7f2f-08dd5c50cbd0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 01:47:04.5567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ia47Y+FN9glS6tyBIwxPY3PLPCicCtm8etnTsZzUVdQ29RgUKqn0htqoGLX5UUhFv0GXMlYr8GFc4WIJke7C6ADf5UILzVNCeWowAQSkXTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6202
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


On 2/25/2025 9:47 AM, Lucas De Marchi wrote:
> On Wed, Feb 12, 2025 at 04:02:20PM -0800, Vinay Belgaumkar wrote:
>> Define PMU events for GT frequency (actual and requested). This is
>> a port from the i915 driver implementation, where an internal timer
>> is used to aggregate GT frequencies over certain fixed interval.
>> Following PMU events are being added-
>>
>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>>
>> Standard perf commands can be used to monitor GT frequency-
>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>>
>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>>
>> Actual frequencies will be reported as 0 when GT is in C6.
>>
>> v2: Use locks while storing/reading samples, keep track of multiple
>> clients (Lucas) and other general cleanup.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pmu.c       | 211 ++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_pmu_types.h |  29 ++++
>> 2 files changed, 230 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 3910a82328ee..ed76756403ea 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -8,6 +8,8 @@
>>
>> #include "xe_device.h"
>> #include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>> +#include "xe_macros.h"
>> #include "xe_pm.h"
>> #include "xe_pmu.h"
>>
>> @@ -37,6 +39,17 @@
>>
>> #define XE_PMU_EVENT_GT_MASK        GENMASK_ULL(63, 60)
>> #define XE_PMU_EVENT_ID_MASK        GENMASK_ULL(11, 0)
>> +#define XE_HRTIMER_INTERVAL_NS        5000000
>> +
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, typeof(struct xe_pmu), base);
>> +}
>> +
>> +static struct xe_device *event_to_xe(struct perf_event *event)
>> +{
>> +    return container_of(event->pmu, typeof(struct xe_device), 
>> pmu.base);
>> +}
>
> we shouldn't add refactors like this in the same patch you are adding a
> new feature, it creates noise in the patch and makes it harder to see
> what's going on. Please drop both event_to_pmu() and event_to_xe().
>
>>
>> static unsigned int config_to_event_id(u64 config)
>> {
>> @@ -49,10 +62,12 @@ static unsigned int config_to_gt_id(u64 config)
>> }
>>
>> #define XE_PMU_EVENT_GT_C6_RESIDENCY    0x01
>> +#define XE_PMU_EVENT_GT_ACTUAL_FREQUENCY    0x02
>> +#define XE_PMU_EVENT_GT_REQUESTED_FREQUENCY    0x03
>
> this will need a rebase
>
>>
>> static struct xe_gt *event_to_gt(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     u64 gt = config_to_gt_id(event->attr.config);
>>
>>     return xe_device_get_gt(xe, gt);
>> @@ -70,7 +85,7 @@ static bool event_supported(struct xe_pmu *pmu, 
>> unsigned int gt,
>>
>> static void xe_pmu_event_destroy(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>
>>     drm_WARN_ON(&xe->drm, event->parent);
>>     xe_pm_runtime_put(xe);
>> @@ -79,7 +94,7 @@ static void xe_pmu_event_destroy(struct perf_event 
>> *event)
>>
>> static int xe_pmu_event_init(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>>     unsigned int id, gt;
>>
>> @@ -104,6 +119,8 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     if (has_branch_stack(event))
>>         return -EOPNOTSUPP;
>>
>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>
> I was going to say that we don't need the other ones. But then I noticed
> XE_PMU_MAX_EVENT_TYPES == 64, which is a lot more than we currently
> support.
>
> I suggested it before, but what's the issue of keeping a linked list of
> the events like rapl_pmu::active_list?

Ok, while testing out the implementation for this, I noticed a 
limitation of using lists-  if we have 2 perf requests for the same 
event, we end up processing that event twice. Since I am adding up 
values every time, that inflates the frequency values by a factor of 2. 
Seems like we need to iterate per GT here instead of per event. So, 
using a bitmask per GT might be better.

Thanks,

Vinay.

>
>> +
>>     if (!event->parent) {
>>         drm_dev_get(&xe->drm);
>>         xe_pm_runtime_get(xe);
>> @@ -113,16 +130,50 @@ static int xe_pmu_event_init(struct perf_event 
>> *event)
>>     return 0;
>> }
>>
>> +static u64
>> +xe_get_pmu_sample(struct xe_pmu *pmu, unsigned int gt_id, uint32_t id)
>> +{
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    val = pmu->event_sample[gt_id][id];
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +static void
>> +xe_store_pmu_sample(struct xe_pmu *pmu, uint32_t gt_id, uint32_t id,
>> +            uint32_t val, uint32_t period)
>> +{
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +    pmu->event_sample[gt_id][id] += mul_u32_u32(val, period);
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static u64 __xe_pmu_event_read(struct perf_event *event)
>> {
>>     struct xe_gt *gt = event_to_gt(event);
>> +    struct xe_device *xe = event_to_xe(event);
>
> gt_to_xe() avoids the additional helper and you don't even need it.
> You are intested in the pmu, not xe... so you could just have used
>
>     pmu = container_of(event->pmu, typeof(struct xe_pmu), base);
>
> ... like is done in other places.
>
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long id;
>>
>>     if (!gt)
>>         return 0;
>>
>> -    switch (config_to_event_id(event->attr.config)) {
>> +    id = config_to_event_id(event->attr.config);
>> +
>> +    switch (id) {
>>     case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>         return xe_gt_idle_residency_msec(&gt->gtidle);
>> +    case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>> +    case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>> +        return div_u64(xe_get_pmu_sample(pmu, gt->info.id,
>> +                   id),
>
> keep in the line above, it doesn't help readability.
>
>> +                   USEC_PER_SEC /* to MHz */);
>
> why is the unit nsec -> usec when storing, couldn't we just use
> NSEC_PER_SEC here?
>
>>     }
>>
>>     return 0;
>> @@ -143,7 +194,7 @@ static void xe_pmu_event_update(struct perf_event 
>> *event)
>>
>> static void xe_pmu_event_read(struct perf_event *event)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered) {
>> @@ -154,8 +205,105 @@ static void xe_pmu_event_read(struct perf_event 
>> *event)
>>     xe_pmu_event_update(event);
>> }
>>
>> +static bool gt_pmu_event_active(struct xe_pmu *pmu, uint32_t id, 
>> uint32_t gt_id)
>> +{
>> +    return pmu->active_mask[gt_id] & BIT_ULL(id);
>> +}
>> +
>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    int i;
>> +
>> +    for_each_gt(gt, xe, i)
>> +        if (gt_pmu_event_active(pmu, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, i) ||
>> +            gt_pmu_event_active(pmu, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, i))
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void xe_pmu_start_timer(struct xe_pmu *pmu, uint32_t gt_id)
>> +{
>> +    /* Timer is per device */
>> +    if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>> +        pmu->timer_enabled = true;
>> +        pmu->timer_last = ktime_get();
>> +        hrtimer_start_range_ns(&pmu->timer,
>> +                       ns_to_ktime(XE_HRTIMER_INTERVAL_NS), 0,
>> +                       HRTIMER_MODE_REL_PINNED);
>> +    }
>> +}
>> +
>> +static void
>> +xe_sample_gt_frequency(struct xe_gt *gt, uint32_t period_ns)
>> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t act_freq, cur_freq;
>> +    int ret;
>> +
>> +    if (gt_pmu_event_active(pmu, XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, 
>> gt->info.id)) {
>> +
>
> drop this line
>
>> +        /* Actual freq will be 0 when GT is in C6 */
>> +        act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>> +        xe_store_pmu_sample(pmu, gt->info.id, 
>> XE_PMU_EVENT_GT_ACTUAL_FREQUENCY,
>> +                 act_freq, period_ns / NSEC_PER_USEC);
>> +    }
>> +
>> +    if (gt_pmu_event_active(pmu, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, gt->info.id)) {
>> +        ret = xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_freq);
>> +        if (!ret)
>> +            xe_store_pmu_sample(pmu, gt->info.id, 
>> XE_PMU_EVENT_GT_REQUESTED_FREQUENCY,
>> +                     cur_freq, period_ns / NSEC_PER_USEC);
>> +    }
>> +}
>> +
>> +static enum hrtimer_restart xe_sample(struct hrtimer *hrtimer)
>> +{
>> +    struct xe_pmu *pmu = container_of(hrtimer, struct xe_pmu, timer);
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    u64 time_diff_ns;
>> +    struct xe_gt *gt;
>> +    ktime_t now;
>> +    int i;
>> +
>> +    if (!READ_ONCE(pmu->timer_enabled))
>> +        return HRTIMER_NORESTART;
>> +
>> +    now = ktime_get();
>> +    time_diff_ns = ktime_to_ns(ktime_sub(now, pmu->timer_last));
>> +    pmu->timer_last = now;
>> +
>> +    /*
>> +     * The passed in period includes the time needed for grabbing 
>> the forcewake.
>
> I don't think this is true anymore, is it?
>
> xe_sample()
>   1. calculate time_diff at the beginning of the function
>   2. for each gt, readout freq samples, using the time_diff, may include
>      delays on forcewake, but that is not included in the time_diff
>   3. htimer is adjusted to timer_last + period
>
>> +     */
>> +    for_each_gt(gt, xe, i)
>> +        xe_sample_gt_frequency(gt, time_diff_ns);
>> +
>> +    hrtimer_forward(hrtimer, now, ns_to_ktime(XE_HRTIMER_INTERVAL_NS));
>> +
>> +    return HRTIMER_RESTART;
>> +}
>> +
>> static void xe_pmu_enable(struct perf_event *event)
>> {
>> +    struct xe_pmu *pmu = event_to_pmu(event);
>> +    struct xe_gt *gt = event_to_gt(event);
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    /* Update event mask */
>> +    pmu->active_mask[gt->info.id] |= BIT_ULL(id);
>> +    pmu->n_active[gt->info.id][id]++;
>> +
>> +    /* Start a timer, if needed, to collect samples */
>> +    xe_pmu_start_timer(pmu, gt->info.id);
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>>     /*
>>      * Store the current counter value so we can report the correct 
>> delta
>>      * for all listeners. Even when the event was already enabled and 
>> has
>> @@ -166,7 +314,7 @@ static void xe_pmu_enable(struct perf_event *event)
>>
>> static void xe_pmu_event_start(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>>
>>     if (!pmu->registered)
>> @@ -176,26 +324,53 @@ static void xe_pmu_event_start(struct 
>> perf_event *event, int flags)
>>     event->hw.state = 0;
>> }
>>
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +    struct xe_device *xe = event_to_xe(event);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long flags;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +    uint32_t gt_id = config_to_gt_id(event->attr.config);
>> +
>> +    raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (--pmu->n_active[gt_id][id] == 0) {
>> +        pmu->active_mask[gt_id] &= ~BIT_ULL(id);
>> +        pmu->timer_enabled &= pmu_needs_timer(pmu);
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>> +
>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>
> if not using a linked list as suggested, please drop this. Instead block
> the event init from succeeding.
>
>>
>> -    if (pmu->registered)
>> +    if (pmu->registered) {
>>         if (flags & PERF_EF_UPDATE)
>>             xe_pmu_event_update(event);
>>
>> +        xe_pmu_disable(event);
>> +    }
>> +
>>     event->hw.state = PERF_HES_STOPPED;
>> }
>>
>> static int xe_pmu_event_add(struct perf_event *event, int flags)
>> {
>> -    struct xe_device *xe = container_of(event->pmu, typeof(*xe), 
>> pmu.base);
>> +    struct xe_device *xe = event_to_xe(event);
>>     struct xe_pmu *pmu = &xe->pmu;
>> +    uint32_t id = config_to_event_id(event->attr.config);
>>
>>     if (!pmu->registered)
>>         return -ENODEV;
>>
>> +    XE_WARN_ON(id >= XE_PMU_MAX_EVENT_TYPES);
>
> ditto.
>
> Lucas De Marchi
>
>> +
>>     if (flags & PERF_EF_START)
>>         xe_pmu_event_start(event, flags);
>>
>> @@ -270,6 +445,10 @@ static ssize_t event_attr_show(struct device *dev,
>>     XE_EVENT_ATTR_GROUP(v_, id_, &pmu_event_ ##v_.attr.attr)
>>
>> XE_EVENT_ATTR_SIMPLE(gt-c6-residency, gt_c6_residency, 
>> XE_PMU_EVENT_GT_C6_RESIDENCY, "ms");
>> +XE_EVENT_ATTR_SIMPLE(gt-actual-frequency, gt_actual_frequency,
>> +             XE_PMU_EVENT_GT_ACTUAL_FREQUENCY, "Mhz");
>> +XE_EVENT_ATTR_SIMPLE(gt-requested-frequency, gt_requested_frequency,
>> +             XE_PMU_EVENT_GT_REQUESTED_FREQUENCY, "Mhz");
>>
>> static struct attribute *pmu_empty_event_attrs[] = {
>>     /* Empty - all events are added as groups with .attr_update() */
>> @@ -283,6 +462,8 @@ static const struct attribute_group 
>> pmu_events_attr_group = {
>>
>> static const struct attribute_group *pmu_events_attr_update[] = {
>>     &pmu_group_gt_c6_residency,
>> +    &pmu_group_gt_actual_frequency,
>> +    &pmu_group_gt_requested_frequency,
>>     NULL,
>> };
>>
>> @@ -290,8 +471,11 @@ static void set_supported_events(struct xe_pmu 
>> *pmu)
>> {
>>     struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>
>> -    if (!xe->info.skip_guc_pc)
>> +    if (!xe->info.skip_guc_pc) {
>>         pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_ACTUAL_FREQUENCY);
>> +        pmu->supported_events |= 
>> BIT_ULL(XE_PMU_EVENT_GT_REQUESTED_FREQUENCY);
>> +    }
>> }
>>
>> /**
>> @@ -306,6 +490,8 @@ static void xe_pmu_unregister(void *arg)
>>     if (!pmu->registered)
>>         return;
>>
>> +    hrtimer_cancel(&pmu->timer);
>> +
>>     pmu->registered = false;
>>
>>     perf_pmu_unregister(&pmu->base);
>> @@ -334,6 +520,11 @@ int xe_pmu_register(struct xe_pmu *pmu)
>>     if (IS_SRIOV_VF(xe))
>>         return 0;
>>
>> +    raw_spin_lock_init(&pmu->lock);
>> +
>> +    hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +    pmu->timer.function = xe_sample;
>> +
>>     name = kasprintf(GFP_KERNEL, "xe_%s",
>>              dev_name(xe->drm.dev));
>>     if (!name)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index f5ba4d56622c..cd68cba58693 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,7 @@
>> #include <linux/spinlock_types.h>
>>
>> #define XE_PMU_MAX_GT 2
>> +#define XE_PMU_MAX_EVENT_TYPES    64
>>
>> /**
>>  * struct xe_pmu - PMU related data per Xe device
>> @@ -34,6 +35,34 @@ struct xe_pmu {
>>      * @supported_events: Bitmap of supported events, indexed by 
>> event id
>>      */
>>     u64 supported_events;
>> +    /**
>> +     * @lock: Lock protecting enable mask and sampling
>> +     */
>> +    raw_spinlock_t lock;
>> +    /**
>> +     * @active_mask: Bit representation of active events
>> +     */
>> +    u64 active_mask[XE_PMU_MAX_GT];
>> +    /**
>> +     * @n_active: Counts for the enabled events
>> +     */
>> +    unsigned int n_active[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> +    /**
>> +     * @timer: Timer for sampling GT frequency.
>> +     */
>> +    struct hrtimer timer;
>> +    /**
>> +     * @timer_last: Timestmap of the previous timer invocation.
>> +     */
>> +    ktime_t timer_last;
>> +    /**
>> +     * @timer_enabled: Should the internal sampling timer be running.
>> +     */
>> +    bool timer_enabled;
>> +    /**
>> +     * @event_sample: Store freq related counters.
>> +     */
>> +    u64 event_sample[XE_PMU_MAX_GT][XE_PMU_MAX_EVENT_TYPES];
>> };
>>
>> #endif
>> -- 
>> 2.38.1
>>
