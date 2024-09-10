Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EB8EE01E9
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 21:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B557810E92B;
	Tue, 10 Sep 2024 21:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1poo3og";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741D10E92B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 21:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726004093; x=1757540093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OsJMR4grCRV9XzPOWrFjuPC05vEpS4/h50b8M8iT3I4=;
 b=g1poo3ogqalZzXGsWM1hBlZjAows92g+zws2jYOpa/3jCDC9FBzYL3F8
 RKcnEjDy4tzMZEoS6uK9HTL+oj/e2vwLwClLCYnw6VqExXflQ5g+57MA0
 5EF5u+U3+oQz5bqJF8MR9mtsbqA9S14r7X9Ee6XZarmEZIFoiekz5YDyX
 BBO7ghaGmslJ+b6eOw/MDANTjTZ20zEP6rTsVjdvp9szANpSzYTRDoy1+
 hlpCmXkQxpWkdbz0GiLrnb5xcPXBi3tvKa1dky9aZehS0Wi1TR97K/NGY
 pfKcs1OmjOSqHbzPnESdP5xhIDyGnbaCIAkXcEVqJIPkLoLdzYczWcqVO A==;
X-CSE-ConnectionGUID: D8ifM2NPT4CELuKVLIWvbQ==
X-CSE-MsgGUID: LLMv+aqGToqx0OWrvSXEww==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24273522"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24273522"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 14:34:52 -0700
X-CSE-ConnectionGUID: ZLr/oOIdS9m214dte/Hhzg==
X-CSE-MsgGUID: kp74+nScQoOVWEcy9pKLcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67914797"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 14:33:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 14:33:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 14:33:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 14:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUEMEN97J3KQjbkQ0EjBfiypwuSmojdRyYDy94Z8kVIdAzCFGrKmrntpnw9LOfMxGWWB96GHUsaDSDjtEorauynBgxFd7scXC2O+eFMR9MemSzmH++JFvkwNLp70ASOihvA3SrvRpRPEBsmDmIFLoa+1uzeqqPFMF+7Gw4wuuChgFs0iAxYKXoWvUtiD5BA6li+KMXLZ8RQtr33TD+RDzuvOFkxXsPrTg+eaRyn7IJJoAk2bfSXBWyPqOXt0gitXaaqy6iuFoWVcL32v5bYsY2WS6jbgsKbkw5P4RonZJNO4LCsdvEGDiWom68ZB5UaSeJPHho2vyxAQL37ppdY71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUhsaxmVuEfdIzH0dTbTrjM0tXFHKcbK9Oheudmt2cE=;
 b=YLAl/FucAlB7ctAbKx9RRso6fC4QabkbYz1xrO/tIQXeeM8nqU+VkZ2GYdoNz3pCTgVFZYxY2bkxOasu9ay6kwScBkRVRiaMc0cLq/gnq5YiTFkZapsQiPuOCp7y3o3BPubbaCUtL3u9P9GwDKCfHUvXt7XfoG0r0c2waJlg8doy3aiKBmlVfai+u9MBdYKvmMHSLyEMhD7bD8P+Fb7tJyDOwCzjNh3U00gyCQO2fTtLHYJ7LyLn6J+mogLtn4gDT/lNN/lylUVtHYusSQDzlF9PgkvkJ9oI9KMfskVVhcjXLokWCv6yXOeixdD3DXszjdK8yLqEeYXbnDO0z4BEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5120.namprd11.prod.outlook.com (2603:10b6:a03:2d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 21:33:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 21:33:24 +0000
Date: Tue, 10 Sep 2024 16:33:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5] drm/xe: Add driver load error injection
Message-ID: <tpweqdb7sux3pfnz6762omn5jate6xugqfxmm7wcfq3gf7qfmv@5ukqvov3au42>
References: <20240910152241.1554435-1-francois.dugast@intel.com>
 <ZuC2BiKnZEaXAY1N@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuC2BiKnZEaXAY1N@intel.com>
X-ClientProxiedBy: MW4PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:303:8f::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b8ed19-4a17-42b2-a418-08dcd1e03364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0tqRVFld29rT0pTNVBDNTVpZm4zZitTeTBEajFXbWZUanVpNFdXaUxhbDZD?=
 =?utf-8?B?VGxZRTN4RlVJTm05b3o5M0NYT2taZVQxdTFUU0YzanRtejRRRWdqNy96dTZB?=
 =?utf-8?B?N3M2Z1REV0NabUNaQXdReWYwTTVtNklaQkpXSmp1V0IyQWs0amM4TlVTcjl5?=
 =?utf-8?B?WHM2V3djMGNHZlc2RUd5dU05QUh6N0w5cjhVVjdIMFA2Ym9zWUlERkZsd1N0?=
 =?utf-8?B?WHVRSzM3dlZNSGZaRTNQMkQ4RGJVT2YxMEZUVkV6UnNiMzZQakpRcGltbytt?=
 =?utf-8?B?ZnJ5d2wwOGh4N2tPVlM5aHNIT3ZUbzA3MkxZK0Q3ZC9zQUl2ck5SaGNRa0hB?=
 =?utf-8?B?UkNoNFo3bXVabDJucFFqWjI2RVVJVE82Wm5tRFNGYm9PeS84SWdkMGM0WCt3?=
 =?utf-8?B?TzR6a0pvMzBzTys2bXR4M1E5NnRPa3RpN1hDUGtlN2xvRVl6ZlB1Z1hDUFdI?=
 =?utf-8?B?R1NGWk16ejk2U3FncklzczlldXVRdG8xbEN3c0J3bVZvaHNlT3RKRXpnd043?=
 =?utf-8?B?QlQ2c1JKakZzUTVvMVoyK01UM0RxUzlhUWlSN001ekFHcUF5S25GTWNlSks4?=
 =?utf-8?B?UEZjWG4wS3lsaHFWMDZiM0p0YlArc1hkWFlCOFBOS3RldTYzVnlaSXNIMXdY?=
 =?utf-8?B?bEMvNXFlQUM5V1Q1Y0RuczJ4UHJRb0h1RmpZUTRGTlcySmRnMjN2alkybjAw?=
 =?utf-8?B?dUVlUjRxWGFLUkJOa2RESS9jdTRidHZxdUNUZFROUDVlc1I4VVJESmdJMUJQ?=
 =?utf-8?B?cTd2NExVREo1L0VNK0dMNTREWTN6YUxEM3orMGlLdXBQMFp0SCs4MTBEbS82?=
 =?utf-8?B?S2R6b2VHcUpEVEZrOWRzWU0xWTNmc3ZiMWNyaklpR0xzZ1JHVzU1Tm0zZ2U3?=
 =?utf-8?B?S2QzcFZyRzU5VEd4K3lnRGV4b2lVSEJuc0Nrc205RndxWS80TUptWmFhTTR0?=
 =?utf-8?B?MWw5NUMzeGFrU1Jub3dRRUNhRXI2ZEVjT0EyK0NHVDlHMHhnZ2NrTG5ReVY3?=
 =?utf-8?B?aWYrTU5oZXZkYThqaUhFblVwQVN1bGdEWERLK3EySXNGQU5NMitSdjFKVW9p?=
 =?utf-8?B?UWFUQnBhb2lTZXN0Qlk5eEMrc05oeXU3Vk5FTUMwbHFwN2tIc3liODg1WlVp?=
 =?utf-8?B?eGhhSWprZUtpcUJmclU3WnZFOFhVOWhQZlpxM0d2TzJVSzJINFA1OVhHRmgw?=
 =?utf-8?B?a1lSUjUzUWF0NUx0K0dMa0d1VVdQZis1OHlmaWtmTzJEQzg2eFJtOHh3b3ND?=
 =?utf-8?B?Z1dJMWhJbGlyR2I4RzNVbm1icGFUSXZ3MDY0TzhPL3RXZ3Q3V3ZjU0l1SWJ2?=
 =?utf-8?B?T2Z0b09aWlhrcWxnQ1ZJRHkvbjZLMkNxdWlNM1B2KzJyZWdNcTllZk5mN3Vz?=
 =?utf-8?B?OGpLM3ZKQjd6ZzdmdjdkZk5UK1VPZ3NuZ3l0cExMTDdIMVBlVDdwQncvTFhw?=
 =?utf-8?B?MTJNcTUwM2ZnUzFkRTFjR1lXWUFiWjQ1VkkxazBqblJTUEVaL2l4Q3Uwb3Zq?=
 =?utf-8?B?Zi9XdHQ1eXJhSERDb2RqUTJJVDBWQUhMRjVaTW4venFTUGxzMXU5UDluRWh1?=
 =?utf-8?B?MW1EbkkzQ2pnMWRxejBucVhQb1FITm41UGh3V0h4R2pKUDAwOERaL0QvSjVo?=
 =?utf-8?B?K1ZDSXdIRUxDNEpJRW9MQmF5UEFwT3hoQmdXWkVLS2JqVmdLSHZXZ1dpS0FY?=
 =?utf-8?B?QXozUEtucGI0Q0xLY2tBdUZhYWlRR2tFVU5Jb0tXTHE1QzVJK2ZQTnEvUVl5?=
 =?utf-8?B?UmludURZdFkwS1E0NitweTFMcDBHekxxTFh1QXp4ck8xVEVGYlJsZUhuZFdh?=
 =?utf-8?Q?vbW+clJ0D66OmKmLpZCYAKdf5JAiZyLgeDWXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExnc1pvUTgwcnZrdWswZHRGY2lHV2JFTmJ3TkNaMkRhM0RPRi9xS3AySkQ2?=
 =?utf-8?B?K2xUWVBseVY2SzY5ZG81UUJHdkdRbXhQSEUvdWtpRlZIK1k1cW4rL2JrTG5n?=
 =?utf-8?B?cmNSSW8wengwbU9IcW9kVWhEUnY0bHFVMWVLeHFvRHpKekhCcHVEWFRTQXlI?=
 =?utf-8?B?Z1FHRlNEdERUZ1VYNUFla1dYOUNYNTQ4bmI2RDNLYmxZTjRTbmU3cy9LWWcz?=
 =?utf-8?B?bFYxVmx5QlA4QjBvajYyVDhiSkpYUTY3aDE3SWs5ZWVqc2kvcVRiUUQ5RlRI?=
 =?utf-8?B?YkZaVGpWSHpIVUhVeDJMcDJlNWV5aUZNN2V2SytKZm5EUWtEYkJpTmc0RkFw?=
 =?utf-8?B?OCtXZEJUOWVPai8wcDRjSklyVkpRRjJiZHQ5UThTNDB6K3R4QUxRcmdZWkUy?=
 =?utf-8?B?QTBHMVpQVUxyUEpPaERCYXVBQlEvc1pjRFlkbk84UHdkMkd5SjRGeE1DUHZt?=
 =?utf-8?B?Z1poNW5iZHYxMnNlZlRpT3JuMjFwWVVsVzh5d1VFMW1paUZUcTZwWkVQNU5t?=
 =?utf-8?B?eEEyNlBiMXU2ZDRxK0h3bXJySkVWQXYvMmZRQ3VkZGFKZXBNaVl5cHFBOS9O?=
 =?utf-8?B?eTNOMFRFdlBTZG55c3ltQk9FZ0RtU2tGT0hEVE1naXNCT0JqQ1BZd2Q0ZXo3?=
 =?utf-8?B?L2phUVVYSU5PSmdHMXhZaFBmUFZ2WWdteDhTUWV4U3NRUGdRSXVqdjZ4bjQ1?=
 =?utf-8?B?OG1YTXdrbWtNSWEydExHbWdrQjJCMVlqV2dOc3pXQi9VRmdqUnJMSXFXV0Ey?=
 =?utf-8?B?NFMxSFlLTFVTWk9sSXNjcG5uWWRKWG9EWlh2bmQvMHpmVlEvdGhvbVNJZjRj?=
 =?utf-8?B?OVhxUkhBUm5hT0xDQ1RnZmJra2k0aWpMdnRPQ0FUMXNlYkxHLzltN2pzZWpw?=
 =?utf-8?B?SW5jOXIxYktGL2d2RjIzMkMyZ3E3VG9YTk02bk9MSG1JUGdDb255UDVtQmti?=
 =?utf-8?B?alFqcS82Y1J6M0tVT1JpeTJ4Zm5uenRGWFlDdkxqbXp2RDdnUFpoaHpEd2NP?=
 =?utf-8?B?NEJ6ZUxHd2c4ZFgxRUZ4OUtRbjRuVEVXaGRiODBiNmhMdlYya3lDNlBjZkFD?=
 =?utf-8?B?enpaOWNCV1pRYXNEQ1RWZzZVSWhRSjByTnZoVEl0dUFsZW1MTWg2UjFmc0xJ?=
 =?utf-8?B?QkxmT2t6U2FhYzFnbWRlczJlQ3AremUyc2tMUVJkbDBDdzFsYWkySXk1MERS?=
 =?utf-8?B?ditmV3Fha2g2MEdyelhMN0ZwWmR6aWZqeGVxWjVYc1hPRWhxQXg1VndjaUZk?=
 =?utf-8?B?NkZ2eGRzQXJnYVhEbDZ2ekg2RW5MTGUySDJWNHBTK3F5bnpBZktRS1JudDYv?=
 =?utf-8?B?VndTU2VTNFBMWFZZU0Y1cnE4a2NORWVLNEVzeDZFeEQvT2NsRFRHNXNpMDFM?=
 =?utf-8?B?RnFvNnc2VlgrbG1pVkdBQnp5ZUx1cjlqSDVpUEJXdForVVJDWXFkRDFzTlFK?=
 =?utf-8?B?VGxTdkt1WVVaQmM5S3VjZEtIa2JSdDlDZnRiMFlNZWpObHIzZURrazg5dFUz?=
 =?utf-8?B?SGdDREx6ZkN2N0Rpb2IrOEdNUEdnRjF0bFljRUdVNHIxRHdHYjFodFdFVDdX?=
 =?utf-8?B?UVhFSjU1bjNyZVRJcVVMbmN4c3dYWDFZMCtWMTdqN21BZGVIcVRuelpia3hS?=
 =?utf-8?B?Skc0RHA5QVErUmNYcUQ2YmJxVUxiblU2VzNRbDZVZTVrTWU0eENTRzJyczF6?=
 =?utf-8?B?RENNQ2F2MHY1cGlPSW5jRVlrRjljNFJvYXpGbjhUemlIWm1qaEtXeVYvajNi?=
 =?utf-8?B?NkdkYUlQK3IyVDFIQnMwYnRDdS9kZHlmRmtXd3d0T1lFK0xnc3RDUXpMeTlo?=
 =?utf-8?B?R0xSYkVjY3MraWtKeUtjRWNXOXQvcmRGWXplOTBoc2EwNnp3VlorZTliclRw?=
 =?utf-8?B?enZ0ZFprV2N4R1hKLzVMR20xemJPYkoyRGlJYmpVclJGSU4yRHB6TVFxMlky?=
 =?utf-8?B?SkFQeFRsaUNrR2FLelJMVmIxaHVhRDJRdkhTWVZnMXc4SklsODFNcHpaNjJ5?=
 =?utf-8?B?UjBwOVVQMHlSTlJwVlZTemRsMXhtMHdlUnAxaVVuWHlQL3U0Q2ovM1F2aWw5?=
 =?utf-8?B?VUtHOW15WHU0STA4R1ZSVzdRNmNiemVqMjNZMlg1bk5NOU5UbWhsUnoydHFP?=
 =?utf-8?B?L29EUjdCcVlONDlBZnV3YzJSeC91ekplTktXTXp5K0ZhczZZWHI0c3BaYVE4?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b8ed19-4a17-42b2-a418-08dcd1e03364
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 21:33:24.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlPbfpZg8701ZupfB0pl05eRkySMksNRTFoJp5A9f2Cbz2WBr7sLAZELViFYalU6WMSPFIXw17uDq44f+I8TlO6ug8FwJ2jsSkwWrvtT19I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5120
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

On Tue, Sep 10, 2024 at 05:11:34PM GMT, Rodrigo Vivi wrote:
>On Tue, Sep 10, 2024 at 05:22:41PM +0200, Francois Dugast wrote:
>> Those new macros inject errors by overriding return codes. They must
>> manually be called, preferably at the very beginning of the function
>> that will fault, otherwise if not possible by turning this pattern:
>>
>>     err = foo();
>>     if (err)
>>         return err;
>>
>> into:
>>
>>     err = foo();
>>     err = xe_device_inject_driver_probe_error(xe, err);
>>     if (err)
>>         return err;
>>
>> When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
>>
>> When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
>> be overridden when the module argument inject_driver_load_error is
>> set to value X. By doing so, it is possible to test proper error
>> handling and improve robustness for current and future code. A few
>> injection points are added in this patch but more need to be added.
>> One way to use this error injection at driver probe is:
>>
>>     for i in {1..200}; do
>>         echo "Run $i"
>>         modprobe xe inject_driver_probe_error=$i;
>>         rmmod xe;
>>     done
>
>can we have an IGT test so we ensure that CI is tracking and we are working
>to close the existing issues?

yeah.. that would be great. I think it would make more sense to use
bind/unbind in igt.

>
>>
>> In the future this is expected to be replaced by the infrastructure
>> provided by fault-inject.h
>
>I was taking a look at the fault-inject again. It could easily be a
>global fault_attr with a module sysfs entry, then during the test
>you load the module, then unbind the device, then change the fault-inject
>probability and time and then bind it back what will reprobe, but now
>with the fault-injected.
>
>The only problem with the fault-inject idea is that it would require
>a very granular thing with multiple fault_attr, one per failure.

when going with a real fault-injection, I'd actually try to cover it per
function as described here:

https://docs.kernel.org/fault-injection/fault-injection.html
	/sys/kernel/debug/fail_function/inject:

	Format: { ‘function-name’ | ‘!function-name’ | ‘’ }

	specifies the target function of error injection by name. If the
	function name leads ‘!’ prefix, given function is removed from injection
	list. If nothing specified (‘’) injection list is cleared.

Integration via ALLOW_ERROR_INJECTION() is similar to the
KUNIT_STATIC_STUB_REDIRECT() we already use.

In my review I didn't bother to go with fault-inject directly because we
will probably need to refactor the code so the failure points are in
their own functions. Something we don't have today. Short term it's
important to fix the current/unknown problems. Mid term we can convert
things piece meal.

Are we on the same page?

>But at least this really ensures that we are really testing all the cases
>with more reliability.
>
>I just realized that this i915-style probe injection might have an issue
>on platforms with discrete platforms. Well, the pci subsystem won't

one more reason to go with the bind/unbind. Then you control where it's
happening and where.

Lucas De Marchi

>probe in parallel, and likely it will be the same order of probe on
>every module load, but if it doesn't the Nth point of the failure
>won't be the same everytime, so in every load you might stop in a
>different device and end up with not covering every single entry.
>Unlikely I know... And I don't believe this should be a blocker
>to move forward with something...
>
>(more below)
>
>>
>> v2: Fix style and build errors, modparam to 0 after probe, rename to
>>     xe_device_inject_driver_probe_error, check type when compiled out,
>>     add _return macro, move some uses to the beginning of the function
>> v3: Rebase
>> v4: Improve commit message and comments, keep if/return rather than
>>     change the flow inside the macro (Lucas De Marchi)
>> v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
>>     Add finish wrapper, move to function beginning for all xe functions
>>     (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/ext/i915_utils.c |  4 +-
>>  drivers/gpu/drm/xe/xe_device.c              | 48 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device.h              | 30 +++++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h        |  5 +++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c |  5 +++
>>  drivers/gpu/drm/xe/xe_guc.c                 |  1 +
>>  drivers/gpu/drm/xe/xe_guc_ct.c              |  1 +
>>  drivers/gpu/drm/xe/xe_guc_pc.c              |  4 ++
>>  drivers/gpu/drm/xe/xe_mmio.c                |  5 +++
>>  drivers/gpu/drm/xe/xe_module.c              | 17 ++++++++
>>  drivers/gpu/drm/xe/xe_module.h              |  3 ++
>>  drivers/gpu/drm/xe/xe_pci.c                 |  5 +++
>>  drivers/gpu/drm/xe/xe_pm.c                  |  5 +++
>>  drivers/gpu/drm/xe/xe_sriov.c               |  7 ++-
>>  drivers/gpu/drm/xe/xe_sriov_pf.c            |  6 +++
>>  drivers/gpu/drm/xe/xe_tile.c                | 13 ++++++
>>  drivers/gpu/drm/xe/xe_uc.c                  |  4 ++
>>  drivers/gpu/drm/xe/xe_wa.c                  |  8 +++-
>>  drivers/gpu/drm/xe/xe_wopcm.c               |  7 ++-
>>  19 files changed, 172 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/ext/i915_utils.c b/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> index 43b10a2cc508..11d8377a125f 100644
>> --- a/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> +++ b/drivers/gpu/drm/xe/display/ext/i915_utils.c
>> @@ -4,6 +4,7 @@
>>   */
>>
>>  #include "i915_drv.h"
>> +#include "xe_device.h"
>>
>>  bool i915_vtd_active(struct drm_i915_private *i915)
>>  {
>> @@ -16,11 +17,10 @@ bool i915_vtd_active(struct drm_i915_private *i915)
>>
>>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>>
>> -/* i915 specific, just put here for shutting it up */
>>  int __i915_inject_probe_error(struct drm_i915_private *i915, int err,
>>  			      const char *func, int line)
>>  {
>> -	return 0;
>> +	return __xe_device_inject_driver_probe_error(i915, err, 0, func, line);
>>  }
>>
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 449b85035d3a..f22d94ff302e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -319,6 +319,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>  			      xe->drm.anon_inode->i_mapping,
>>  			      xe->drm.vma_offset_manager, false, false);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (WARN_ON(err))
>>  		goto err;
>>
>> @@ -477,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>  		goto mask_err;
>>
>>  	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		goto mask_err;
>>
>> @@ -498,6 +500,11 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>>  {
>>  	struct xe_gt *gt = xe_root_mmio_gt(xe);
>>  	unsigned long timeout, start;
>> +	int err;
>> +
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>>
>>  	if (!IS_DGFX(xe))
>>  		return 0;
>> @@ -750,6 +757,8 @@ int xe_device_probe(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_sanitize_freq(gt);
>>
>> +	xe_device_inject_driver_probe_error_finish();
>> +
>>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>
>>  err_fini_display:
>> @@ -1000,3 +1009,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_declare_wedged(gt);
>>  }
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +/**
>> + * __xe_device_inject_driver_probe_error - Inject an error during device probe
>> + * @xe: xe device instance
>> + * @err_injected: the error to inject
>> + * @err_real: the error returned by the actual function
>> + * @func: the name of the function where this is called from
>> + * @line: the line where this is called from
>> + *
>> + * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
>> + *
>> + * Return: err_real if != 0, err_injected otherwise
>
>Not just otherwise....
>
>Return 0 if this is not the Nth iteration of the requested iterations from
>modparam.inject_driver_probe_error
>
>Return err_injected if in the Nth iteration...
>
>> + */
>> +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
>> +					  const char *func, int line)
>> +{
>> +	if (err_real != 0)
>> +		return err_real;
>> +
>> +	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
>> +		return 0;
>> +
>> +	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
>> +		return 0;
>> +
>> +	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
>> +		 err_injected, xe->inject_driver_probe_error, func, line);
>> +
>> +	xe_modparam.inject_driver_probe_error = 0;
>> +	return err_injected;
>> +}
>> +
>> +void __xe_device_inject_driver_probe_error_finish(void)
>> +{
>> +	/* After probe finishes, stop checking for error injection */
>> +	xe_modparam.inject_driver_probe_error = 0;
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 894f04770454..c410e55b6b09 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -178,4 +178,34 @@ void xe_device_declare_wedged(struct xe_device *xe);
>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>  void xe_file_put(struct xe_file *xef);
>>
>> +#define XE_DEVICE_INJECTED_ERR -ENODEV
>> +#define xe_device_inject_driver_probe_error(__xe) \
>> +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
>> +#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
>> +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
>> +					      __LINE__)
>> +#define xe_device_inject_driver_probe_error_finish()	\
>> +	__xe_device_inject_driver_probe_error_finish()
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +
>> +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>> +					  int err_injected, int err_real,
>> +					  const char *func, int line);
>> +
>> +void __xe_device_inject_driver_probe_error_finish(void);
>> +
>> +#else
>> +
>> +static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>> +							int err_injected, int err_real,
>> +							const char *func, int line)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline void __xe_device_inject_driver_probe_error_finish(void) {};
>> +
>> +#endif
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index ec7eb7811126..582b8b7cdee4 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -487,6 +487,11 @@ struct xe_device {
>>  		int mode;
>>  	} wedged;
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	/** @inject_driver_probe_error: Counter used for error injection during probe */
>> +	int inject_driver_probe_error;
>> +#endif
>> +
>>  #ifdef TEST_VM_OPS_ERROR
>>  	/**
>>  	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>> index 0e23b7ea4f3e..b5da321bbbea 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
>> @@ -12,6 +12,7 @@
>>  #include "regs/xe_guc_regs.h"
>>  #include "regs/xe_regs.h"
>>
>> +#include "xe_device.h"
>>  #include "xe_mmio.h"
>>  #include "xe_gt_sriov_printk.h"
>>  #include "xe_gt_sriov_pf_helpers.h"
>> @@ -275,6 +276,10 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
>>  {
>>  	int err;
>>
>> +	err = xe_device_inject_driver_probe_error(gt_to_xe(gt));
>> +	if (err)
>> +		return err;
>> +
>>  	pf_init_versions(gt);
>>
>>  	err = pf_alloc_runtime_info(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 5599464013bd..eb764b44ced7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -353,6 +353,7 @@ int xe_guc_init(struct xe_guc *guc)
>>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>>
>>  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>> +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
>>  	if (ret)
>>  		goto out;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 4b95f75b1546..51ffb05605bb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -202,6 +202,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>  	ct->bo = bo;
>>
>>  	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		return err;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 034b29984d5e..d27d843057e7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -1064,6 +1064,10 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>  	int err;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	if (xe->info.skip_guc_pc)
>>  		return 0;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 3fd462fda625..a4cf082d3261 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>  {
>>  	size_t tile_mmio_size = SZ_16M;
>>  	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>> +	int err;
>> +
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>>
>>  	mmio_multi_tile_setup(xe, tile_mmio_size);
>>  	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 77ce9f9ca7a5..3de603e0438f 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -56,6 +56,23 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>>  MODULE_PARM_DESC(force_probe,
>>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +/*
>> + * The error code at checkpoint X will be overridden when the module argument
>> + * inject_driver_load_error is set to value X. By doing so, it is possible to
>> + * test proper error handling and improve robustness for current and future
>> + * code. One way to test multiple error injection points:
>> + *
>> + * for i in {1..200}; do
>> + *     echo "Run $i"
>> + *     modprobe xe inject_driver_probe_error=$i;
>> + *     rmmod xe;
>> + * done
>> + */
>> +module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
>
>we need to break this line... or perhaps get a smaller word for the param name?
>
>> +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
>> +#endif
>> +
>>  #ifdef CONFIG_PCI_IOV
>>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>>  MODULE_PARM_DESC(max_vfs,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 161a5e6f717f..47cefaf8d79b 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -20,6 +20,9 @@ struct xe_modparam {
>>  	char *force_probe;
>>  #ifdef CONFIG_PCI_IOV
>>  	unsigned int max_vfs;
>> +#endif
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	int inject_driver_probe_error;
>>  #endif
>>  	int wedged_mode;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 3bce0e550a63..9bb60b300727 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -644,8 +644,13 @@ static int xe_info_init(struct xe_device *xe,
>>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>>  	struct xe_tile *tile;
>>  	struct xe_gt *gt;
>> +	int err;
>>  	u8 id;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	/*
>>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>>  	 * descriptor to use from hardware registers. desc->graphics will only
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9c59a30d7646..a059be07a11d 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -258,6 +258,7 @@ int xe_pm_init_early(struct xe_device *xe)
>>  		return err;
>>
>>  	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		return err;
>>
>> @@ -276,6 +277,10 @@ int xe_pm_init(struct xe_device *xe)
>>  {
>>  	int err;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	/* For now suspend/resume is only allowed with GuC */
>>  	if (!xe_device_uc_enabled(xe))
>>  		return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index 5a1d65e4f19f..c7512d8acc28 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -102,11 +102,13 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>>   */
>>  int xe_sriov_init(struct xe_device *xe)
>>  {
>> +	int err;
>> +
>>  	if (!IS_SRIOV(xe))
>>  		return 0;
>>
>>  	if (IS_SRIOV_PF(xe)) {
>> -		int err = xe_sriov_pf_init_early(xe);
>> +		err = xe_sriov_pf_init_early(xe);
>>
>>  		if (err)
>>  			return err;
>> @@ -114,7 +116,8 @@ int xe_sriov_init(struct xe_device *xe)
>>
>>  	xe_assert(xe, !xe->sriov.wq);
>>  	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
>> -	if (!xe->sriov.wq)
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (!xe->sriov.wq || err)
>>  		return -ENOMEM;
>>
>>  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index 0f721ae17b26..8d75bb6570f0 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -80,8 +80,14 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>>   */
>>  int xe_sriov_pf_init_early(struct xe_device *xe)
>>  {
>> +	int err;
>> +
>>  	xe_assert(xe, IS_SRIOV_PF(xe));
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> index dda5268507d8..774668ac67b4 100644
>> --- a/drivers/gpu/drm/xe/xe_tile.c
>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>> @@ -114,6 +114,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>>  {
>>  	int err;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	tile->xe = xe;
>>  	tile->id = id;
>>
>> @@ -127,6 +131,15 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>>
>>  	xe_pcode_init(tile);
>>
>> +	/*
>> +	 * xe_tile_alloc() and xe_gt_alloc() only fail with -ENOMEM.
>> +	 * drmm_zalloc() is used so resources will be freed even if
>> +	 * an error is injected.
>> +	 */
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 0d073a9987c2..6eaef7a3c58e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -135,6 +135,10 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>>  {
>>  	int ret;
>>
>> +	ret = xe_device_inject_driver_probe_error(uc_to_xe(uc));
>> +	if (ret)
>> +		return ret;
>> +
>>  	/* GuC submission not enabled, nothing to do */
>>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>>  		return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 28b7f95b6c2f..8baad6106968 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -825,6 +825,11 @@ int xe_wa_init(struct xe_gt *gt)
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
>>  	unsigned long *p;
>> +	int err;
>> +
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>>
>>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>> @@ -833,7 +838,8 @@ int xe_wa_init(struct xe_gt *gt)
>>  	total = n_gt + n_engine + n_lrc + n_oob;
>>
>>  	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
>> -	if (!p)
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (!p || err)
>>  		return -ENOMEM;
>>
>>  	gt->wa_active.gt = p;
>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>> index d3a99157e523..70674b30c4c6 100644
>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>> @@ -206,6 +206,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>>  	bool locked;
>>  	int ret = 0;
>>
>> +	ret = xe_device_inject_driver_probe_error(xe);
>> +	if (ret)
>> +		return ret;
>> +
>>  	if (!guc_fw_size)
>>  		return -EINVAL;
>>
>> @@ -252,8 +256,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>>  		guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>>
>>  check:
>> +	ret = xe_device_inject_driver_probe_error_override(xe, ret);
>>  	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
>> -			   guc_fw_size, huc_fw_size)) {
>> +			   guc_fw_size, huc_fw_size) && !ret) {
>>  		wopcm->guc.base = guc_wopcm_base;
>>  		wopcm->guc.size = guc_wopcm_size;
>>  		XE_WARN_ON(!wopcm->guc.base);
>> --
>> 2.43.0
>>
