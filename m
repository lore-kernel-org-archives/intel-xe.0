Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8D4D1A628
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D6A10E8CB;
	Fri,  9 Jan 2026 13:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTAVrRVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1B610E8CB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767966151; x=1799502151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=Tl5Wz61yHjz5nanl6K0cpV+0peUdCeMiW4q4PBHSHuk=;
 b=bTAVrRVaFC9qiWlJQCmjdoBCq/97/gi+HW91YPXPnN02vuGOgmC/dAYs
 InjqL9FnoE0ic8pzi3yjsU0tL46Y+Yg64OQ8RpiBL5dg/Tj0Bb13Eglvx
 Jytp9xbtM2h+gU6noZz8rYa12GPLWgRgh6oh0xYiQPZ83pe4vG6zbcdiY
 ZToD7qHtmcMEEHdX07qtJvdII9LUwzMbFGEnYmviOGh4E0Qrb9mXFYXIQ
 8j7GBY8VwFIFoqBVXRFHS3dt/hcHtKQD8/ognbZy0oXLQsdI+VXyErBXr
 t6LjH6NydsnzYb+007OdOad6YzuTIVdhOGWM2Nj49bSkHgEW59k5Wiv0U w==;
X-CSE-ConnectionGUID: 7aOf62lTSTSZ15+Y3Lm3wA==
X-CSE-MsgGUID: MFCWwCk/R0CizicNKoaf1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80714642"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208,217";a="80714642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 05:42:31 -0800
X-CSE-ConnectionGUID: z+yxdUEES8ymG5n13Rg9wA==
X-CSE-MsgGUID: g6Y6o/5BQ3O9Yj5m7sZJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
 d="scan'208,217";a="203094686"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 05:42:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 05:42:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 05:42:30 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 05:42:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARaUPLEWYAu1Y3XsJiBltm+LmE9vwupJ/nLlBWjt8svHKumgyUDiLISmQRYgkGuQQx7434sBRghcTBOXfxK/jBcGs0HU8unoYHi8zznF/Eh1Z2NrFlYaXh3bt30xT54q1AZKTXXjbMscSLAanZtOb0s3iEG6QRLYAFlHk1a0yhTJ2VMkQZ9uKF54PONVM2NDRqQn8Vqv2WyYNelqRJe5BFPIoRgwWsiYtZ7AguqsAdYLpMQ7tCjvo93es4IT29f1KQLZWxgls0TF6oKxhTwDp/h5qwt3Ha/tI5YHYzoxvoYeIFU7PoJPnqiqncg2HdD+UAW2QHpLmmV9vfL0Lt1CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms57H8HwmnZxs0HmDcTLqslhqmsNOv0Cc/RPnXnKzDM=;
 b=kML7u4WHhWN2EQmC7JLMiLLJI+NZ4ft9ao65+essbQpUdh82VfIF+FrNWf/eUxfyFYjeGnynFf2xa2d0QoYqNLAd2KN0Gc+6dbzxQBKuic/LZ9/Y4wzVSJb/YBEVDozoJFUq2JJUF+hD2XG4WD20Km6B/N/AojJGr8lzB2+pWe5pps0ONXuX2ksPsXVpyvTfpM6Jg/cs6m1lWS1qp5mBLwYez28mJKEkZrsBqpIsRFHf6EUc4bUnYf8in6nr/UZ8DS45LFfbrAcYHh+YoWtKbEOwAV/ERB5erZncKVlHmOpru63wkJKpzVViOjE3cIVww3QWgBqfmWnW2MgjbRjgnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CH3PR11MB7867.namprd11.prod.outlook.com (2603:10b6:610:12a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 13:42:28 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 13:42:28 +0000
Content-Type: multipart/alternative;
 boundary="------------h94vzlxHrmmpAw7sbQ7mvAGP"
Message-ID: <0476ce78-0609-4324-82e5-35d6d60988e4@intel.com>
Date: Fri, 9 Jan 2026 19:12:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm/xe/hwmon: Expose temperature limits
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
References: <20260108130323.426531-1-karthik.poosa@intel.com>
 <20260108130323.426531-2-karthik.poosa@intel.com>
 <aWDKXG14vg-7Ajza@black.igk.intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aWDKXG14vg-7Ajza@black.igk.intel.com>
X-ClientProxiedBy: PN2PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::16) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CH3PR11MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 64fb342a-9c87-4848-6794-08de4f84edbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a29EaW9TSWFUMnZsR2VTaUc3bUVYWVVlZ0ZiQjltMXhHbGtoNUh4RDdvOFlh?=
 =?utf-8?B?akJmYW56Q1dMenlnRmFZUUhqOFNVSldHbEJGb3JMRmI2WnFPK3JVYVBpTm9L?=
 =?utf-8?B?Skh3bE5SK3ZRZityekhtOXFHcHFJa3o1SUtaK0VBTXJManhENSs1THFqWVlz?=
 =?utf-8?B?M2UzSzd5cTUxR2pwck5BZXdWZlA5ZDBOR1ZaY1h0dHMrWnd2LzQvenYyaW1J?=
 =?utf-8?B?R0VyUzVmSEY4K2haaU9uT2IwNE5uVlgwTDRMdjZTUmxKemU3d0IyR2xDc3o0?=
 =?utf-8?B?M21STkhKNXdZN1FPSXRSVUZPYWxUNFpBRk1QQ1gyY1cwWUhkN2lHMHFOSTBS?=
 =?utf-8?B?N1JUdzhRbTNNeHZ5YUQ2YmN6VGlTSStFZ0pkVWhsK0hBcGhicnZhVzdOT2xZ?=
 =?utf-8?B?K09IMTVnRlpYZk8xYy8wY0ZaR2VvVFNzak0raEJVWDdjV3hLWGh4OVhQRkxt?=
 =?utf-8?B?Syt3M012VDBEWGpUWkFMZnJ1dk11SjZ6emFGdHZaOXpVTzZoWVVGS1A2aEVI?=
 =?utf-8?B?anY4Nmo3UEVFdVdGUE5HVEFGLzVRdm0rZ2haRE1hU21UazNyc2VmWTVFaGMv?=
 =?utf-8?B?OEMxL3F6K0EycTQvNjJXWmdlQmJMeEdVd0RNVE5jMlo2REpiREN2bzNnek5m?=
 =?utf-8?B?THIrNWkveEh2OE5EMmpQU1RoSnlYbHEvZzlFREZTZzVXUjJ4NUNKWTBEdGll?=
 =?utf-8?B?Q2xCekFSMk81cS9oUWZ6ZWNoQTVnaGIyZ0lHSU15UTVVOHBNWG1vNlBqWFd4?=
 =?utf-8?B?V2dZOFYxK255TG9rOFN4YzFtbWdQN0ZFRGcvTHNCSm9ENmFyQ2tDMi81cENw?=
 =?utf-8?B?ZTlRT1dTTXhRUlB0Z1lKZHBCRmd2SGRzV0U5b3VUa3RCNm1NNThyaGpqVkgz?=
 =?utf-8?B?eWZWM0pSSjJ0RzJWM3hCLy80dWtibUhnNm9NVVJVSzFRMnRFVUtrOTRJOEhD?=
 =?utf-8?B?cE5UVzgyTDAzS3VEUldmTUpTMjAycmhRV3IxSWIrTjhHZFhLakpSelNWVlNy?=
 =?utf-8?B?RVR1cU1pZzlYeUJ6N3drL0xNUjk1SElmdE1NRjZQMnlHdHBHRW0zOVlRM1hn?=
 =?utf-8?B?bXNHUFZmRUt6R280cGw1b0pVRmFUeE5ldStOMUt1VDRBTjBGQlRoNnhiUlJH?=
 =?utf-8?B?azVBd3haanJtVmVHYkpIUlFKNHJSWWdFU3doU3doSXZETzZrNmRZM0J5dGla?=
 =?utf-8?B?cHptNEE0WlRwSGg3M1N5N0F6R2JPU2UrUHYzUmtySmIyUklZTGw2Umc3QWFB?=
 =?utf-8?B?MzVOdjU4S2VGY1NpSWRqeXZ2V0YwNmRmSUR4NFBKazZMMnZLUk5SS2MzK2ph?=
 =?utf-8?B?WHpmWmJoakpGQXZoWS9qUUxSVWpBcHJ6dFJrMEdZVTJQM2ZzblJoU1VHellj?=
 =?utf-8?B?bDhpc0pSM0l0bU1zL1BWWVRZdGpHN2JoRjZrWXRUMW1KbFRNaHVmMWQ5NjFC?=
 =?utf-8?B?dVovWE9EK1BqREFQTTBRVWdteXBoR3Z4QzVnaVJsVHIxMjNueFQ0amthQkJk?=
 =?utf-8?B?enR6Zzl0TWxKbVI0SXhMOGNuVHczUURqSnlzSXhvQnBTUkpwVkFIMzNOZWph?=
 =?utf-8?B?MytRaHdOejE3S2NhS25nN3lBU08wakNGMzdmVUdna3podUQ0LzIrSzVsOVR6?=
 =?utf-8?B?cmdCbnRBdG5tYXJtMWVPeXRiZ1pZLzZNZzZhNmNmNjhMa3AxVXNBclBJY2Ju?=
 =?utf-8?B?djhBNnpOL0RHVjVhTUYyYmRJQWUvY21yS0MzR1NlK1dUM1F4WXRRRjF6eTho?=
 =?utf-8?B?TGIzM1VLTmNEbUhUQk1LTmg4ajJoSk9vK2hQb2Ywc1hwVnlJeit3S0VkUVlv?=
 =?utf-8?B?VzZYSHdyLy9mNHYzNUVqeEVOVlMvOVRYTDE2VkxaL0pRbFNvaW5xLzBMKzRC?=
 =?utf-8?B?QzAxWWVoUTREVmU3RVZjRXNtVDl1TWhWa01WTUwzQm9NUjdjK0tPQW9Ta1lw?=
 =?utf-8?Q?xqO9R1IlBktKSSr+m3qIdZgHeqqPFe+I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09PZVVLQmw5aUdpNWM0Zzc4MGRiRGZyd2tCTExCczZ1UFUvVVdkNHJXYmxx?=
 =?utf-8?B?SnZhdjRha1VsbWZ1VzZ4UitKcTV5ek1OWWt5NUtyclgwTWppRUdFamlpT0dJ?=
 =?utf-8?B?djIyNEhEb0FzMDhHMGxNd0xzKytBaSs3c0JZQ3VVazRRRkN1cUVYYXprRWp2?=
 =?utf-8?B?UkRJQnBMdUFsUXZ2blNuNEgrdVluYWxWekVGVkkyN1pxUUJaRXRBMG9ZMncw?=
 =?utf-8?B?cW9Ba0h5cUtHTVN4OTJwczZDZzlPOU5lcm0wYVB1ZERWUGdqTWNNc043cDhp?=
 =?utf-8?B?VDlQNmhFMGJzZlord1ZKb2xlMW1IdTNSemcrWXQ2MGtiUmNzNTdER2VGbzB5?=
 =?utf-8?B?dEJkU1JPWWtESXQ4akhOcGZqZVQrK2VGYVZaUHlLbERrV0RxQUVFOVR4a1ZC?=
 =?utf-8?B?QkloOE1wS2RQK2I3Vk1PQU1KQ3dwaUxhSkR5OGtsMFo0eTA0WHRucGF5QVJC?=
 =?utf-8?B?aDlOSFNMcVF5YlZxUkltSXRSWjhpSWI2ZUY5YWwvNlpxUEI0c0l5Wmt3aDdL?=
 =?utf-8?B?Qnp3aktMQWNVMWFSdExTS040M3cwRkxiWWhldG4zQ3RNVXFLZlpMemIraDlV?=
 =?utf-8?B?a09ubGpKTkYxM21kY3ZDMTlDMStNd2JMMTRBYm5iTnFvSFpxa1NmMDREaXRJ?=
 =?utf-8?B?YzgrNlpxd1pzZHNtZEg5VE9uS1NzRjZSRmNtRnF1b3NvNk9Wak1WaGw3clhr?=
 =?utf-8?B?TkNPZW1hTXQ0VG1jR0NkMEdnbXoyTXVscUUraFJJWjRqbW5CSkZKMUJKa0VY?=
 =?utf-8?B?eVI1elZhWkxoREFocnc1eFM3SGFFSERzTnhDbWszY0UyV1FzZjN4S1RzQjdl?=
 =?utf-8?B?STBrc0hPWHgzZjFleDl4VGo4UnA0Zjk5N1NsVFlXaVdINTdPRkVjYVdzNWto?=
 =?utf-8?B?UXRCODlCNWJwS3VJOU1OWFNtNjJRanVQZjFTUDNjOE1JQUlNemZOYlVCVkhM?=
 =?utf-8?B?MlZPc1NUNlBIUVhtNlFEeHdMbkp0aGI1dDZJbW1xbFgxZ1ZZbGpnR2NZSFp2?=
 =?utf-8?B?VEdPUmVjV05oUWdoWkFYOThJRzg5SzlQMHdwalJ1WDRUako4WVd1SE0vNjlz?=
 =?utf-8?B?Z0VocUk0WnBXOTVGaEpmY0tTQm5nb1FDWTlSVnlobGowQitSV0J0WnA5TWcx?=
 =?utf-8?B?bWpidVhnWVA3MWY3VVM3VDMxRkxPQUFBMzQ5YWtOUmIvaGdJTFNWUURmUHpH?=
 =?utf-8?B?MTZZZzFNbC9reEhVNUoxZHJqL2RiZmg5WDhJQ0Q1OFRrSGgvVlBFQVF2YzRN?=
 =?utf-8?B?aXQ1ZDBTUFVqL2dkNnpnRmxONUI4SGlzVHR0emk3TTZrbmVZejVZTnRpTDYz?=
 =?utf-8?B?OHFPZU01eVRPZlFudVp2eEhSTHZOVEcrL1NtYVkxSlNXdndFL1lLMmVieG50?=
 =?utf-8?B?MVNIWVNZUkZKNGtnK0h0UENDTGVWVWg2S3l2UlJOaFFLTXc3bEp6NDdMUkth?=
 =?utf-8?B?V1NSQkpOSWowWlpuR21WYUY5bUR1cWR0aml6bTRzLy9QbGRheWRPRXVydm0w?=
 =?utf-8?B?TVpBTHRqajBsSUdEYW9ZU2I5VnkzajMxMSszWmx5T0RHZTZ5NjFkZGhWU2ln?=
 =?utf-8?B?aWRvQzZmZkl6N3dYUVVWZTYraEh4Qi9paFpwbkE1YnFIbG9RMmt6enlQc2gr?=
 =?utf-8?B?TGEyVi8zR2E5b1hpWTBpSzBwM1piUFh2NHJxczcwd0tMaC81K2Flc3VDL2hK?=
 =?utf-8?B?ZnNHdVJMaWdnR2pQVnJEYnU2NEQxcTBITis3dlFac2I4SjcwN2RyZXdwYXE0?=
 =?utf-8?B?djFPTmtpUjdzLzJwWTFkMVZxY1FUV3hhWW9maksvYUo3Y3FhMWpVa1crYkxi?=
 =?utf-8?B?NWVhbksyZ1BlWEtON0VsaytPeEVHTFZ6M01qdTdjSmdUc3dPK2VneGlzQlRi?=
 =?utf-8?B?M0RtMEw0RW0reUlmQXE0QUR0WWw1TFdGbXRuZ0hyeWRLSFhOMTBQelQ5ZHI1?=
 =?utf-8?B?cnMyTGdaMEE3Tk5xRi9OSGpMRVZPR004SllHSnlxbFdmQW1QT2RQUEdIak1E?=
 =?utf-8?B?MmVkMXh3R3hRQkQwSDREUEY3U3JROUJ5ZDBHY054ZUlHeXMvNFdRaDlXekxF?=
 =?utf-8?B?dHZuUTNodDVsbDJwVDRiajJtdi9tL0VPVW01T3dwZ2l5bjNUQXIxUTEwMDhy?=
 =?utf-8?B?ZnJwZkkwbSt2Mk11R0U3c015dkhRaUlnSjF2aFAzMUtjaS9TSXhIaDNKTDNp?=
 =?utf-8?B?UVU1M01FZFd4OC9Eb0NPQm13cnM1VENzNGtya01RTUdmSndrM2FLcFYzREFy?=
 =?utf-8?B?ME81ZmhyNmJmTXRoOGdqUjdjaSs1NytqcDdHRUlSdnIzSkRTQ1ZlRjhzSGZS?=
 =?utf-8?B?cTBRaGdRamdNQURsRzRNVjU2QnRIK0I5RFhqcjFjZnZwaUFITHVUdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64fb342a-9c87-4848-6794-08de4f84edbc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 13:42:27.9680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZQ+H0ZvdfnaTBPfPPRvsOD9Q38URAoZeUEw0FWA+EptNtpQ+KpimO2GBwK3m31ylCDZuFMXUcvq29miKEG1bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7867
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

--------------h94vzlxHrmmpAw7sbQ7mvAGP
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09-01-2026 14:59, Raag Jadav wrote:
> On Thu, Jan 08, 2026 at 06:33:20PM +0530, Karthik Poosa wrote:
>> Read temperature limits using pcode mailbox and
>> expose shutdown temperature limit as tempX_emergency,
>> critical temperature limit of as tempX_crit and
>> GPU average temperature limit as tempX_max.
> Looks like this can be less lines, please utilize the remaining space.
>
>> Update Xe hwmon documentation for these entries.
>>
>> v2:
>>   - Resolve a documentation warning.
>>   - Address below review comments from Raag.
>>   - Update date and kernel version in Xe hwmon documentation.
>>   - Remove explicit disable of has_mbx_thermal_info for unsupported
>>     platforms.
>>   - Remove unnecessary default case in switches.
>>   - Remove obvious comments.
>>   - Use TEMP_LIMIT_MAX to compute number of dwords needed in
>>     xe_hwmon_thermal_info.
>>   - Remove THERMAL_LIMITS_DWORDS macro.
>>   - Use has_mbx_thermal_info for checking thermal mailbox support.
>>
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 +++++++
>>   drivers/gpu/drm/xe/xe_device_types.h          |   2 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 107 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pci.c                   |   3 +
>>   drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>   6 files changed, 152 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index d9e2b17c6872..c3b367c42741 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>>   		milliseconds over which sustained power is averaged.
>>   
>>   		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. Package average temperature limit in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
>> +
>> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:	RO. VRAM critical temperature in millidegree Celsius.
>> +
>> +		Only supported for particular Intel Xe graphics platforms.
> Group these with existing temperature entries as per channel index in
> alphabetic order.
>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 7d46d5ecda91..e359889b4378 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -322,6 +322,8 @@ struct xe_device {
>>   		 * pcode mailbox commands.
>>   		 */
>>   		u8 has_mbx_power_limits:1;
>> +		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands */
> Nit: "supports thermal ..."
>
>> +		u8 has_mbx_thermal_info:1;
>>   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
>>   		u8 has_mem_copy_instr:1;
>>   		/** @info.has_mert: Device has standalone MERT */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index ff2aea52ef75..db00728c89e4 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -53,6 +53,15 @@ enum xe_fan_channel {
>>   	FAN_MAX,
>>   };
>>   
>> +enum xe_temp_limit {
>> +	TEMP_LIMIT_PKG_SHUTDOWN,
>> +	TEMP_LIMIT_PKG_TJMAX,
>> +	TEMP_LIMIT_MEM_SHUTDOWN,
>> +	TEMP_LIMIT_PKG_CRIT,
>> +	TEMP_LIMIT_MEM_TJMAX,
>> +	TEMP_LIMIT_MAX,
> This is guaranteed last member so redundant comma.
>
>> +};
>> +
>>   /* Attribute index for powerX_xxx_interval sysfs entries */
>>   enum sensor_attr_power {
>>   	SENSOR_INDEX_PSYS_PL1,
>> @@ -111,6 +120,18 @@ struct xe_hwmon_fan_info {
>>   	u64 time_prev;
>>   };
>>   
>> +/**
>> + * struct xe_hwmon_thermal_info - to store temperature data
>> + */
>> +struct xe_hwmon_thermal_info {
>> +	union {
>> +		/** @limit: temperatures limits */
>> +		u8 limit[TEMP_LIMIT_MAX];
>> +		/** @data: temperature limits in dwords */
>> +		u32 data[(TEMP_LIMIT_MAX / sizeof(u32)) + ((TEMP_LIMIT_MAX % sizeof(u32)) ? 1 : 0)];
> I think this can be (((TEMP_LIMIT_MAX - 1) / sizeof(u32)) + 1) but please
> double check.
>
>> +	};
>> +};
>> +
>>   /**
>>    * struct xe_hwmon - xe hwmon data structure
>>    */
>> @@ -137,7 +158,8 @@ struct xe_hwmon {
>>   	u32 pl1_on_boot[CHANNEL_MAX];
>>   	/** @pl2_on_boot: power limit PL2 on boot */
>>   	u32 pl2_on_boot[CHANNEL_MAX];
>> -
>> +	/** @temp: Temperature info */
>> +	struct xe_hwmon_thermal_info temp;
>>   };
>>   
>>   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
>> @@ -677,8 +699,11 @@ static const struct attribute_group *hwmon_groups[] = {
>>   };
>>   
>>   static const struct hwmon_channel_info * const hwmon_info[] = {
>> -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>> -			   HWMON_T_INPUT | HWMON_T_LABEL),
>> +	HWMON_CHANNEL_INFO(temp,
>> +			   HWMON_T_LABEL,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
> Let's make this alphabetic order.
>
>> +			   HWMON_T_MAX,
>> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
> Ditto.
>
>>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>>   			   HWMON_P_CAP,
>>   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>> @@ -689,6 +714,19 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>>   	NULL
>>   };
>>   
>> +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	int ret = 0;
> Redundant initialization.
>
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>> +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>> +	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
>> +		hwmon->temp.data[0], hwmon->temp.data[1]);
>> +
>> +	return ret;
>> +}
>> +
>>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
>>   {
>> @@ -787,6 +825,34 @@ static umode_t
>>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>>   	switch (attr) {
>> +	case hwmon_temp_emergency:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
>> +		case CHANNEL_VRAM:
>> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
> I don't believe we'll ever reach here, so please drop the dead code.
>
>> +	case hwmon_temp_crit:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
>> +		case CHANNEL_VRAM:
>> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
> Ditto.
>
>> +	case hwmon_temp_max:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
>> +		default:
>> +			return 0;
>> +		}
>> +		break;
> Ditto.
>
>>   	case hwmon_temp_input:
>>   	case hwmon_temp_label:
>>   		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
>> @@ -807,10 +873,38 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   
>>   		/* HW register value is in degrees Celsius, convert to millidegrees. */
>>   		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>> -		return 0;
>> +		break;
> and we don't have a reason to continue here, so let's try to return where
> possible.
>
>> +	case hwmon_temp_emergency:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>> +			break;
> Ditto.
>
>> +		case CHANNEL_VRAM:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
>> +			break;
> Ditto.
>
>> +		}
>> +		break;
> Ditto.
>
>> +	case hwmon_temp_crit:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
>> +			break;
> Ditto.
>
>> +		case CHANNEL_VRAM:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
>> +			break;
> Ditto.
>
>> +		}
>> +		break;
> Ditto.
>
>> +	case hwmon_temp_max:
>> +		switch (channel) {
>> +		case CHANNEL_PKG:
>> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
>> +			break;
> Ditto.
>
>> +		}
>> +		break;
> Ditto.
>
>>   	default:
>>   		return -EOPNOTSUPP;
>>   	}
>> +	return 0;
> With above in place, this won't be needed.
>
>>   }
>>   
>>   static umode_t
>> @@ -1263,6 +1357,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   	for (channel = 0; channel < FAN_MAX; channel++)
>>   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>>   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +
>> +	if (hwmon->xe->info.has_mbx_thermal_info)
>> +		if (xe_hwmon_pcode_read_thermal_info(hwmon))
> These can be a single if condition with && operation.
I kept it this way to avoid showing unsupported logs on platforms where 
support is not probed at all.
>
>> +			drm_dbg(&hwmon->xe->drm,
>> +				"Thermal mailbox support not present in firmware\n");
> Nit: "not supported by firmware"
this can be "Thermal mailbox not supported by card firmware"
>
>>   }
>>   
>>   int xe_hwmon_register(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index a1fdca451ce0..776ed4bd538b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
>>   	.has_fan_control = true,
>>   	.has_flat_ccs = 1,
>>   	.has_mbx_power_limits = true,
>> +	.has_mbx_thermal_info = true,
>>   	.has_gsc_nvm = 1,
>>   	.has_heci_cscfi = 1,
>>   	.has_i2c = true,
>> @@ -421,6 +422,7 @@ static const struct xe_device_desc cri_desc = {
>>   	.has_gsc_nvm = 1,
>>   	.has_i2c = true,
>>   	.has_mbx_power_limits = true,
>> +	.has_mbx_thermal_info = true,
>>   	.has_mert = true,
>>   	.has_pre_prod_wa = 1,
>>   	.has_soc_remapper_sysctrl = true,
>> @@ -686,6 +688,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	/* runtime fusing may force flat_ccs to disabled later */
>>   	xe->info.has_flat_ccs = desc->has_flat_ccs;
>>   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>> +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>>   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 5f20f56571d1..20acc5349ee6 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -48,6 +48,7 @@ struct xe_device_desc {
>>   	u8 has_late_bind:1;
>>   	u8 has_llc:1;
>>   	u8 has_mbx_power_limits:1;
>> +	u8 has_mbx_thermal_info:1;
>>   	u8 has_mem_copy_instr:1;
>>   	u8 has_mert:1;
>>   	u8 has_pre_prod_wa:1;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 975892d6b230..6c84c1780fe9 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -65,6 +65,9 @@
>>   #define       FAN_TABLE				1
>>   #define       VR_CONFIG				2
>>   
>> +#define   PCODE_THERMAL_INFO			0x25
>> +#define     READ_THERMAL_LIMITS			0x0
> This file is full of randomly ordered commands so at some point
> we might want to order them correctly. For now just add this above
> PCODE_LATE_BINDING.
>
> Raag
>
>>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>>   /* Frequency Config Sub Commands (param1) */
>>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
>> -- 
>> 2.25.1
>>
--------------h94vzlxHrmmpAw7sbQ7mvAGP
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-01-2026 14:59, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aWDKXG14vg-7Ajza@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Jan 08, 2026 at 06:33:20PM +0530, Karthik Poosa wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Read temperature limits using pcode mailbox and
expose shutdown temperature limit as tempX_emergency,
critical temperature limit of as tempX_crit and
GPU average temperature limit as tempX_max.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Looks like this can be less lines, please utilize the remaining space.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Update Xe hwmon documentation for these entries.

v2:
 - Resolve a documentation warning.
 - Address below review comments from Raag.
 - Update date and kernel version in Xe hwmon documentation.
 - Remove explicit disable of has_mbx_thermal_info for unsupported
   platforms.
 - Remove unnecessary default case in switches.
 - Remove obvious comments.
 - Use TEMP_LIMIT_MAX to compute number of dwords needed in
   xe_hwmon_thermal_info.
 - Remove THERMAL_LIMITS_DWORDS macro.
 - Use has_mbx_thermal_info for checking thermal mailbox support.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 +++++++
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 107 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 6 files changed, 152 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d9e2b17c6872..c3b367c42741 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp2_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Package shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp2_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Package critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp2_max
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Package average temperature limit in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp3_emergency
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp3_crit
+Date:		January 2026
+KernelVersion:	7.0
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. VRAM critical temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Group these with existing temperature entries as per channel index in
alphabetic order.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7d46d5ecda91..e359889b4378 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -322,6 +322,8 @@ struct xe_device {
 		 * pcode mailbox commands.
 		 */
 		u8 has_mbx_power_limits:1;
+		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: &quot;supports thermal ...&quot;

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		u8 has_mbx_thermal_info:1;
 		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
 		u8 has_mem_copy_instr:1;
 		/** @info.has_mert: Device has standalone MERT */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ff2aea52ef75..db00728c89e4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -53,6 +53,15 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+enum xe_temp_limit {
+	TEMP_LIMIT_PKG_SHUTDOWN,
+	TEMP_LIMIT_PKG_TJMAX,
+	TEMP_LIMIT_MEM_SHUTDOWN,
+	TEMP_LIMIT_PKG_CRIT,
+	TEMP_LIMIT_MEM_TJMAX,
+	TEMP_LIMIT_MAX,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is guaranteed last member so redundant comma.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+};
+
 /* Attribute index for powerX_xxx_interval sysfs entries */
 enum sensor_attr_power {
 	SENSOR_INDEX_PSYS_PL1,
@@ -111,6 +120,18 @@ struct xe_hwmon_fan_info {
 	u64 time_prev;
 };
 
+/**
+ * struct xe_hwmon_thermal_info - to store temperature data
+ */
+struct xe_hwmon_thermal_info {
+	union {
+		/** @limit: temperatures limits */
+		u8 limit[TEMP_LIMIT_MAX];
+		/** @data: temperature limits in dwords */
+		u32 data[(TEMP_LIMIT_MAX / sizeof(u32)) + ((TEMP_LIMIT_MAX % sizeof(u32)) ? 1 : 0)];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I think this can be (((TEMP_LIMIT_MAX - 1) / sizeof(u32)) + 1) but please
double check.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	};
+};
+
 /**
  * struct xe_hwmon - xe hwmon data structure
  */
@@ -137,7 +158,8 @@ struct xe_hwmon {
 	u32 pl1_on_boot[CHANNEL_MAX];
 	/** @pl2_on_boot: power limit PL2 on boot */
 	u32 pl2_on_boot[CHANNEL_MAX];
-
+	/** @temp: Temperature info */
+	struct xe_hwmon_thermal_info temp;
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -677,8 +699,11 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_LABEL,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Let's make this alphabetic order.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			   HWMON_T_MAX,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
@@ -689,6 +714,19 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	NULL
 };
 
+static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	int ret = 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Redundant initialization.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
+			    &amp;hwmon-&gt;temp.data[0], &amp;hwmon-&gt;temp.data[1]);
+	drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;thermal info read val 0x%x val1 0x%x\n&quot;,
+		hwmon-&gt;temp.data[0], hwmon-&gt;temp.data[1]);
+
+	return ret;
+}
+
 /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
 static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
@@ -787,6 +825,34 @@ static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	switch (attr) {
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't believe we'll ever reach here, so please drop the dead code.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	case hwmon_temp_crit:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	case hwmon_temp_max:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	case hwmon_temp_input:
 	case hwmon_temp_label:
 		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
@@ -807,10 +873,38 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
 		/* HW register value is in degrees Celsius, convert to millidegrees. */
 		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
-		return 0;
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
and we don't have a reason to continue here, so let's try to return where
possible.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		case CHANNEL_VRAM:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		}
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	case hwmon_temp_crit:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
+			break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		case CHANNEL_VRAM:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
+			break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		}
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	case hwmon_temp_max:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
+			break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		}
+		break;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ditto.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	default:
 		return -EOPNOTSUPP;
 	}
+	return 0;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With above in place, this won't be needed.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
 
 static umode_t
@@ -1263,6 +1357,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	for (channel = 0; channel &lt; FAN_MAX; channel++)
 		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
 			xe_hwmon_fan_input_read(hwmon, channel, &amp;fan_speed);
+
+	if (hwmon-&gt;xe-&gt;info.has_mbx_thermal_info)
+		if (xe_hwmon_pcode_read_thermal_info(hwmon))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
These can be a single if condition with &amp;&amp; operation.</pre>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">I
      kept it this way to avoid showing unsupported logs on platforms
      where support is not probed at all.</div>
    <blockquote type="cite" cite="mid:aWDKXG14vg-7Ajza@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			drm_dbg(&amp;hwmon-&gt;xe-&gt;drm,
+				&quot;Thermal mailbox support not present in firmware\n&quot;);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: &quot;not supported by firmware&quot;</pre>
    </blockquote>
    this can be &quot;Thermal mailbox not supported by card firmware&quot;
    <blockquote type="cite" cite="mid:aWDKXG14vg-7Ajza@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> }
 
 int xe_hwmon_register(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a1fdca451ce0..776ed4bd538b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_fan_control = true,
 	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
+	.has_mbx_thermal_info = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
 	.has_i2c = true,
@@ -421,6 +422,7 @@ static const struct xe_device_desc cri_desc = {
 	.has_gsc_nvm = 1,
 	.has_i2c = true,
 	.has_mbx_power_limits = true,
+	.has_mbx_thermal_info = true,
 	.has_mert = true,
 	.has_pre_prod_wa = 1,
 	.has_soc_remapper_sysctrl = true,
@@ -686,6 +688,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	/* runtime fusing may force flat_ccs to disabled later */
 	xe-&gt;info.has_flat_ccs = desc-&gt;has_flat_ccs;
 	xe-&gt;info.has_mbx_power_limits = desc-&gt;has_mbx_power_limits;
+	xe-&gt;info.has_mbx_thermal_info = desc-&gt;has_mbx_thermal_info;
 	xe-&gt;info.has_gsc_nvm = desc-&gt;has_gsc_nvm;
 	xe-&gt;info.has_heci_gscfi = desc-&gt;has_heci_gscfi;
 	xe-&gt;info.has_heci_cscfi = desc-&gt;has_heci_cscfi;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5f20f56571d1..20acc5349ee6 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -48,6 +48,7 @@ struct xe_device_desc {
 	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
+	u8 has_mbx_thermal_info:1;
 	u8 has_mem_copy_instr:1;
 	u8 has_mert:1;
 	u8 has_pre_prod_wa:1;
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 975892d6b230..6c84c1780fe9 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -65,6 +65,9 @@
 #define       FAN_TABLE				1
 #define       VR_CONFIG				2
 
+#define   PCODE_THERMAL_INFO			0x25
+#define     READ_THERMAL_LIMITS			0x0
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This file is full of randomly ordered commands so at some point
we might want to order them correctly. For now just add this above
PCODE_LATE_BINDING.

Raag

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------h94vzlxHrmmpAw7sbQ7mvAGP--
