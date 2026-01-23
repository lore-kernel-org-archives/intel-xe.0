Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15314D77897
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7510EB78;
	Fri, 23 Jan 2026 17:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GlTaFd82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F0910EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769189285; x=1800725285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PUQs2jbgph/WyC/rChH58bKYm8EH3lkKFMCnysejksE=;
 b=GlTaFd821Txs7B9XyUjeNrqnBNbPjrx5Q/EHlgpCcRha08aXHnByz5Yd
 90tWZ62CejgRnZWLErKFFONiUplKVIP3jZ0csTFWqObDQ5lPEjPLvVFrV
 nifh1eDYxKPpE09bpTaInM28A24JN2sfej24WeF2LHC5nfvjQ7yepkYgW
 EJAfLaxfRmzVV32L9GTNUOQyHgiXSV9GWx/1MgiD3mmSQYY1ATSDji53Z
 20Wytcdc/yP6Wl/lIjJ+Y8XFf1qEqEAdV2p2he8eSW9vAfcCfOV1/6deB
 QlvL7t2+5UdDOeppkPlKyhxAS5/lRvKHSMLi/aVF92/GYZjwj9qtpc0Zv Q==;
X-CSE-ConnectionGUID: wMGYcgqwRr6XsIY+7+FZ7A==
X-CSE-MsgGUID: CJrBrkUlSTm8XBTnzEX6rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88020911"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="88020911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:28:04 -0800
X-CSE-ConnectionGUID: FVybKY+/Q16Od38MoqnM6Q==
X-CSE-MsgGUID: LLvY1tPvTtWMZBgg7sUgyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211580943"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:28:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:28:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 09:28:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:28:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLnuvH9lsJHLRFaLZHg1boeWg8kES9XceVZpyeuEeKZ58672W34AAvUuR0wnBU+oQrHx9e1xKXS7/StA+xucWVsqKizdMwGmJY/159ZxL6mz/q7i3LxcjHAybaiib0lHD7N7kxbyS6KrCqOQXBeFOhj6ZOca3z/IsOuKPOqCEvpCaYNMcJRg7bYdi0yg8uXAjRxZ00CYree78dhNZ0Ad9uXXX/kMgkokpDDRpMcBB9L5SU0G6KADxKlrZl4km0xjwp5yYRypr29ljUI2qYXfF0l0geUGQIu0c9D9o7DJ0gipb6Sb2N+MvmCezhJ8K273Ox5GoaRkd3F63WSPEpMAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KJ5PddbkdRGcgg90uzbvMDo43I1LXX7EOgOrTVcW+8=;
 b=MSgTa/POPCdNDloddKx1pgYPo9YCqvoCb51yRH4e8/Wxxfjh35Nj4miXRAvkWGmKCV0avErAyH9UjaFJJ5fW3ft8nACVmG258SNqIr+l0UnJKbXWdg5Qz5NUzaL1XXMjQPaOZic+vj51T3kcel4HglafvryIs3vfEvjBMB9GpS+nh26lsOUi3cwElxVd9Uw2vMYU14sBcxvWu3TOzPbYV7Ukr5yvXXb264FEtmwG9qmhEyC4g9Ty+FooBAauFIQLrnFnrijdkGWllhz45Mf+QIQ1F2wh88HgvMfZ+3/QogKiYhWwnxk+pkcjLI2YYgSfQ/tvreMzJohIkJs8Xe6XOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:28:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:28:01 +0000
Message-ID: <800a6f03-62ea-41c7-ae7b-d25606ccb708@intel.com>
Date: Fri, 23 Jan 2026 09:28:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: "Anirban, Sk" <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
 <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
 <73520ae2-967e-453a-a7ec-dfa0b2d6a080@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <73520ae2-967e-453a-a7ec-dfa0b2d6a080@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 90310ecd-f69d-42c1-2e49-08de5aa4c20f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmo2VGdhSyt5VFgzdHNzRi81YS9uOElQVUdFbGJFWnJwemorZ0ozT3RseDUw?=
 =?utf-8?B?ZE0rS1d4cEpMSEVRRE5GRFY2cnFVckNaS0VNa1VLSytqZm1TZ2wrdThNaUMv?=
 =?utf-8?B?UmZYQUJicjM2NHgyVGg4V1lTc3g1YitvZlVPVjNQMFYrazZtVHVJeGEyYUMx?=
 =?utf-8?B?UkYxekxSZVRFVWFXM3VkRjY3bjVrclVnbmtPMjNmek5EdnBIR1JJVGF5dmM2?=
 =?utf-8?B?ZzJZb1JObWVSeFdvd2Z1clNnMFdaVFpUWVllSkk0T0QzYWdPZDBkVjB6NHFS?=
 =?utf-8?B?bWFvcnU1SHNHeGpNNlBWbTAwNUxMS2wybWJjTEs2OVV0NFVyeEIwRXRpRnVY?=
 =?utf-8?B?eGVjZmxsZVQydWlkTXJKWnJoUEZDYVdVOHBlcTF1V3RnZ3gzYUdONmR1cUM2?=
 =?utf-8?B?Z3cwOUhlT0VNc0t6YmNrU2lwVUNMeEl3YUFSaHdPTHJRbjFiSlFTRGloalJj?=
 =?utf-8?B?NW13aHdJV0huMUViWkJNVS9ZRmxCWng5RW1rRzNPdWFyd1Z2VXNESWZ2Q0hq?=
 =?utf-8?B?UnlEQmwrUWVRZmxwTUdEc21RREM4TFRGSWRuT3hpdjQzOTVCTEludFQ5R3A3?=
 =?utf-8?B?b01FenE5bkhuRTl1eHR1ejNZVUgyVFVFUElGL3B3WU11SjFSY1RsZG1PSTZs?=
 =?utf-8?B?bjkrcXJuaEtFTkFnQUQ3SnNRVEM3dnUvUWlJSWhOblhwZTNHRDBMeGh1YWVn?=
 =?utf-8?B?Z0pIWkVTeVJKZEJXNmt4UDJTbHdpcGk4YktBSDMrMnVUV0RCT2t2Rm9FMmJ6?=
 =?utf-8?B?dk1MRSthekhNd2c4dGJ5dWFibFIxYjVGTWQ1MVJ4eGUvQzlWUndqVmNSWHAw?=
 =?utf-8?B?amdXS3V6QUVYaTdINU40dGt0bDIzL1I3N1g4RzYxV3lOV2lnS3RrNkgvMXRS?=
 =?utf-8?B?QkJTNHhUMks5T0ZnbUlTZlp3TXNIOHZac21vVUVsK2RpMEVIc3hFVmw4WnJN?=
 =?utf-8?B?bkFmZUZEUUFZTHZlTzFpOWw5OFp5UTk4UXJXYzRTU3JBYUlvUnJtNVpyRU9G?=
 =?utf-8?B?R3RuMERaRStVZzh2RkxZSjJueG82aG0yM3BWcE10NUhHOGpOU3hnb2praXVC?=
 =?utf-8?B?TmdTU3BZY1UrNFRwaUUzcXllcm5Fdlh1b002Q3NFQmdDck0vUFRpRStGUG5E?=
 =?utf-8?B?YUU2RzFvTDZsNTY3Y1h5bjBzaHhXTVpXaFFDa1JBT05wSGZVYlUvNFZOaXZE?=
 =?utf-8?B?Sys3Wldqb2cwbVlHUmhPUFRHRlR5Z25GYWRZMXN6cFhHcjczYXloRTBEeWpW?=
 =?utf-8?B?UGRHWm0zOHVaOElrSWFFcytlWkN1U0xnSFZDQmNGOW40OHROdkNyN2x4cFdZ?=
 =?utf-8?B?REJidWxxQzNYV3Zta3AvTVpFOHZsWEVwdkIrMmE3RUhtRkV6YW9KUmZyNTJ1?=
 =?utf-8?B?QzJQWXVaRnIwbERUNWsydTZINmJPU1FyMXNVaEFGcGJWZlB2OHI0alk0cGZO?=
 =?utf-8?B?UDNsTkJJS1BSdkRFZUpaZ0dMV3haaXdJa2hoTEljejZHZ1h0d3FXL3p5QStC?=
 =?utf-8?B?Ym9PN3NLYWgzY1JuYlZXcmN1K0M5QithWVVHcnlNaUZRZ3pzU3MveEg1UzJW?=
 =?utf-8?B?TlpPQ0lQeWVWZDE3NlRmUzh6SDRpY1IyRXo5YWo5L2FiVGJMSHljQWlSUUZD?=
 =?utf-8?B?R1VvYmxURU1RbW5GZmxTdGZIeGNEV2ZBN0dkTnZGSTBsSG42STl3a09QWGFE?=
 =?utf-8?B?Y3hTbXlWdERkWGt1dmM5N0FRTDEwcGJEK2MyclVjMEhndUEydnBjaHEwb1pU?=
 =?utf-8?B?OEtpM2FqRCsrRDJJMjZ0RDUvSUVqekxPZWpiay9LTnpRQ2psc3lLbHlTSVEy?=
 =?utf-8?B?MVJFdms0blE3YzQ2azlpNUtJM1ozaXArTFJUTGo4MlhHSTNueWVvTng2ZVND?=
 =?utf-8?B?dFU2b3NwRVlPckMrTWZ5M1FyZ2p0RVk2LzhIWUprYUU3Y3pBeW0vdi85c0tz?=
 =?utf-8?B?dHlhRUdLcnhtamorazJZTG56Q0tRcEtxZXg2ZmZKL2NLVlhNYUowVnlIdTU0?=
 =?utf-8?B?S1VYTGhjRFpHMEpBWU1xRy9mV1Jkd09ZRlM5cjdlZlJ1dU5Dc0F2V1QxOEt5?=
 =?utf-8?B?dXg1b2F1ZXFCbU1hMUtrSUFaWlc1OUpVWnJyTnVTY0grMG95Ry9pYU41V24w?=
 =?utf-8?Q?BU2k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZtWlB4dDVPS2c4ZjF0SDRnSXhwdmRFa2dGU2hsNCt1L3VMYnVhSUZHbnlr?=
 =?utf-8?B?QmMzck14Z21WNGF2TEdUSGFRSHhzWis3bkJOa1hsT1BwbXo1Q0FGQTRvS2Rz?=
 =?utf-8?B?R1pHTk5SZ1o3Yk5LS0ZpdmdydU9kNk5jeVlMRWxXRHFQejNaMmN6aWlZZjUw?=
 =?utf-8?B?VU9ydm1LL0lGRVRINFFENmVWZG42Y05rNTIwVUFYUWtXYUdHUHpudjhqallK?=
 =?utf-8?B?dHNUeFhVTldCQ0lxVHBSaU1LbUlrbU1nS3UwMDNwdWVtRktsVHdiSHk3Mmds?=
 =?utf-8?B?bWdCZkIwNTJLSzNvN0xCbGNpMEM5NnNJNUxSbm53N3RTMnJ1MXJ2VDBHSVQ3?=
 =?utf-8?B?VW1EdnlYSTJzMUxxSHlkZlBXWjl4KzdLRElONVlSZzB0VVgxZzBDSVpGWXAv?=
 =?utf-8?B?TC95TmIvS251TE1tYVB4eFdHM2U0bWhjdmhzSDN1YjFnZ3lFV1Z1QlNENHln?=
 =?utf-8?B?MmJyK3JwQVN6Ykp1S1pocHlpaFBqWGs1Wm5ERkxNeHVSSjZuZXNSbktzTy9I?=
 =?utf-8?B?bUc1WlpmUUl1WXlYWjZZZ2phcXlOYk1oc2VJc1lHbFNBUnIvNzJ3cVJvWFho?=
 =?utf-8?B?eXNEOHJreDM3NUNWdkM4WVU3YVA0NTlXczhDbkNsZXladHMra0VZSldtWVRu?=
 =?utf-8?B?TzdOZGM0VzdoNmVVRjgyVDBYWkxmOTVkOUVkMmtMMlNsRndWbU43WDdFdjA3?=
 =?utf-8?B?M2owNG5MUm0xVlBHTERJZkNubUFKbjFpNWQrNk1ud2Vkay92R3lWTnNoU3Er?=
 =?utf-8?B?Zm55U21wWjAzSDkveEhCUDh3MDI4anZmNVAvRjd2cWJVdVJ2WmtBdUd2aEhB?=
 =?utf-8?B?dnQ1ekdDZnYvbElnVG4yWXQ4Q1MvVm4rU1lZVUNCRFZIcncza2FwU216RjZt?=
 =?utf-8?B?VmMvamg3aVB2OW1VS1gwODNqWHJHY0FnUHl1VHZYUHNrbzBPQ0xuWUwxai9M?=
 =?utf-8?B?L3RNUmdVaGxnVVlCbDI2ZlVOYm9xVHRSOStQNWpGZ0xCdC9acEFmc0RTVFBH?=
 =?utf-8?B?U0cwckgvaWlYc0x0RlpQY2J0WlJZbXJSYkt4V3RlWVcra0xhd2F3TlhCb2xo?=
 =?utf-8?B?YmNZSEhkRFRXVENhMjhrRDBvOG41cWY1OFpjdEp0RG05MS9pVWJYd3cyVWNq?=
 =?utf-8?B?cXdqbHFka0RsZWo2ZjZ0WWNrQmZSbUdsb0lMbHVma1U1d1lyS2o5T281M0ox?=
 =?utf-8?B?SWZ5d3B0Tjg3Q1lzUXY1T3J5VFJkYUxVaUM4MWhIam9oejgvMk4wZ0xWdGt1?=
 =?utf-8?B?UFk3dk52OFRDU0tqK0F1RDU0NVhwSnRabkk2VlJXRVJFRHU0cTBrMnQ0Z3lG?=
 =?utf-8?B?dllKRmNyckc1eEZHRE5JUlE2Y3BsYWlxVmd5ZjBOTHRvOUNzdnFSSm1ueXR2?=
 =?utf-8?B?QXdWT1RKa2VOWkpCNHBnWjd6eGMvSjgxM1I4eVBuQUF4N3F1SFlIcG8rTEo0?=
 =?utf-8?B?bDdORGFtZ054cHExYnp3Q09EazB2YThGbCtpc1lBWU5WRVl2amQwL2dMcFps?=
 =?utf-8?B?QmVWMllTNjVVS3BENi9pMkJZc0hxTDNwTDlrRHc4K20vMlFheXJ0VHltWGZt?=
 =?utf-8?B?emgveGZRYWFpd3drMk9UZTdpUXB6RFZWUGlqR01mbCtJd2JtdXFUYXNsQTRY?=
 =?utf-8?B?c2xQazhwSU9HNHpjMGp1TzVITWYrTDZVdFkyc0Zha2ZJczFOcllqVlcxKzZt?=
 =?utf-8?B?NkM5RTBlbCswbUZLOW1QZkZSaVlOeVcrTTl3RHZzU2tFUDYvbDR0SlBSQmxz?=
 =?utf-8?B?Z05wby96MVE4ajlNQ3EvSkM2Ylh2Z2VIbHI3V1g2Y28yNGJOdXhCRHpQOS83?=
 =?utf-8?B?d29xN3hCc3RZeGl1MXpMYjNnYW5yY1lnaHB5VFBmdzE2Q09rWEZTclNVaDVZ?=
 =?utf-8?B?SEN3RDAvY1V6OG1UOG9NRXdGaTR5Q3hzdWIzT2VXbUh3K29Balc0YXVJRk5E?=
 =?utf-8?B?YTVCZXRPbDJ2ZUNXaVlsOFdhcUdyWksyMlhGSUxGa1dlZmdkS3N0NWNURnkx?=
 =?utf-8?B?VFdYc1pzaVJYM1BQakdJd3RJYUVRSXRnZjNWWSt6SEhDd1RkNis1bkVLMUJC?=
 =?utf-8?B?dlBzKzRnV1phTGhXSlMzM2wwbDB3ZCs0ck9pTGhEbUlFQ1FjNGhJNlRMdFo1?=
 =?utf-8?B?Vng5dU51Um9TbytjMUNvU0NDRlZLSEZaSnFtOWRCLy95VlpJSU15U1lrdk1k?=
 =?utf-8?B?ZFowdWJwYWtsN3I5SjliSHZ6bmhvQm5JdnpxcVFVY0hzSzNOU1o4SER4Q0M3?=
 =?utf-8?B?WmF5dWdpNGlucVloRlN3dlBqQWJQR3FJYSsrQTJQdEJ4K2pLNXRFeE9pVmFG?=
 =?utf-8?B?RzhDRnN2UUd6WWJPZDhGdUcvM0pXOUU2TVlWc2ZxSlRkNWJHZjNWN0ZYeDRv?=
 =?utf-8?Q?oo9yEsaqPuRqVG+A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90310ecd-f69d-42c1-2e49-08de5aa4c20f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:28:01.2581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ppjnba0uw3C5p4eqbLCyqNFeZMmlt4vrPa4DfHpB8L1xQJdtMxc6KnYxyedBebfTaNDA+qKMRz+cKNxok6TNqKtu7HHlhegbfuxIsPTPMcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
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



On 1/23/2026 9:12 AM, Anirban, Sk wrote:
> Hi,
>
> On 23-01-2026 03:12 am, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 1/16/2026 2:34 AM, Sk Anirban wrote:
>>> Prevent GuC firmware DMA failures during GuC-only reset by disabling
>>> idle flow and verifying SRAM handling completion. Without this, reset
>>> can be issued while SRAM handler is copying WOPCM to SRAM,
>>> causing GuC HW to get stuck.
>>>
>>> v2: Modify error message (Badal)
>>>      Rename reg bit name (Daniele)
>>>      Update WA skip condition (Daniele)
>>>      Update SRAM handling logic (Daniele)
>>>
>>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>>>   drivers/gpu/drm/xe/xe_guc.c           | 30 
>>> +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>>>   3 files changed, 47 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> index 87984713dd12..c9cb02f32f5a 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>> @@ -40,6 +40,9 @@
>>>   #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 
>>> 0x76)
>>>   #define   GS_MIA_IN_RESET            REG_BIT(0)
>>>   +#define GUC_HASH_BOOT_CHECK            XE_REG(0xc010)
>>> +#define   GUC_BOOT_UKERNEL_VALID        REG_BIT(31)
>>> +
>>>   #define GUC_HEADER_INFO                XE_REG(0xc014)
>>>     #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>>> @@ -83,7 +86,12 @@
>>>   #define   GUC_WOPCM_OFFSET_MASK            REG_GENMASK(31, 
>>> GUC_WOPCM_OFFSET_SHIFT)
>>>   #define   HUC_LOADING_AGENT_GUC            REG_BIT(1)
>>>   #define   GUC_WOPCM_OFFSET_VALID        REG_BIT(0)
>>> +
>>> +#define GUC_SRAM_STATUS                XE_REG(0xc398)
>>> +#define   GUC_SRAM_HANDLING_MASK        REG_GENMASK(8, 7)
>>> +
>>>   #define GUC_MAX_IDLE_COUNT            XE_REG(0xc3e4)
>>> +#define   GUC_IDLE_FLOW_DISABLE            REG_BIT(31)
>>>   #define GUC_PMTIMESTAMP_LO            XE_REG(0xc3e8)
>>>   #define GUC_PMTIMESTAMP_HI            XE_REG(0xc3ec)
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>> b/drivers/gpu/drm/xe/xe_guc.c
>>> index 44360437beeb..42658a409556 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>>       return xe_guc_submit_enable(guc);
>>>   }
>>>   +/*
>>> + * Wa_14025883347: Prevent GuC firmware DMA failures during 
>>> GuC-only reset by ensuring
>>> + * SRAM save/restore operations are complete before reset.
>>> + */
>>> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
>>> +{
>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>> +    u32 boot_hash_chk, guc_status, sram_status;
>>> +    int ret;
>>> +
>>> +    guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>>> +    if (guc_status & GS_MIA_IN_RESET)
>>> +        return;
>>> +
>>> +    boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
>>> +    if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
>>> +        return;
>>> +
>>> +    xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, 
>>> GUC_IDLE_FLOW_DISABLE);
>>> +
>>
>> The WA says that we also need to wait for the status to be "ready" 
>> after setting GUC_IDLE_FLOW_DISABLE.
>>
>> Daniele
>>
> As discussed, a GuC reset can occur without firmware interaction, and 
> during RC6 exit the GuC load status may transition, meaning it will 
> not always be INTEL_GUC_LOAD_STATUS_READY.
>
> So we’re checking GS_MIA_IN_RESET instead. I just want to confirm that 
> this is enough to ensure FW is present before applying the WA.

The GS_MIA_IN_RESET check + boot_hash_chk are enough to determine if the 
FW is present. However, waiting for the ready state is not about 
confirming if it is present, it is about waiting for the FW 
initialization to complete after we've confirmed that it is indeed 
present. Basically the WA is saying that we can't do a GuC reset while 
GuC init is still in progress.

Daniele

>
> Thanks,
>
> Anirban
>
>>> +    ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, 
>>> GUC_SRAM_HANDLING_MASK,
>>> +                 0, 5000, &sram_status, false);
>>> +    if (ret)
>>> +        xe_gt_warn(gt, "SRAM handling not complete 
>>> (GUC_SRAM_STATUS: 0x%x)\n",
>>> +               sram_status);
>>> +}
>>> +
>>>   int xe_guc_reset(struct xe_guc *guc)
>>>   {
>>>       struct xe_gt *gt = guc_to_gt(guc);
>>> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>>>         xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>   +    if (XE_GT_WA(gt, 14025883347))
>>> +        guc_prevent_fw_dma_failure_on_reset(guc);
>>> +
>>>       if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>           return xe_gt_sriov_vf_bootstrap(gt);
>>>   diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
>>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>>> @@ -73,3 +73,12 @@
>>>   15015404425_disable    PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>>>   16026007364    MEDIA_VERSION(3000)
>>>   14020316580    MEDIA_VERSION(1301)
>>> +
>>> +14025883347    MEDIA_VERSION(1301)
>>> +        MEDIA_VERSION(2000)
>>> +        MEDIA_VERSION(3000)
>>> +        MEDIA_VERSION(3002)
>>> +        MEDIA_VERSION(3500)
>>> +        MEDIA_VERSION(3503)
>>> +        GRAPHICS_VERSION_RANGE(3000, 3001)
>>> +        GRAPHICS_VERSION_RANGE(3003, 3005)
>>

