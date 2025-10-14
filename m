Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376F0CCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EB110E171;
	Tue, 14 Oct 2025 08:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QC6JPRC3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237510E171
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429088; x=1791965088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fNGNEqj+q/I4jW/l03Vm4GKzVBPCMbcH3duJ+QkDslw=;
 b=QC6JPRC3rHMR4moPum3WFfJn8thNn//D+czZmqtIKh1/3AZ/ai1hmPMa
 IS34rDExl1mhn8xL4CS4sSnQIokaQZNhN+jXN7K2802T3RPDkgEXIiAa0
 Voml3B2mRxkW14mGaBuQmQvYa5DgUtAlUK/TPPJCeSOu1q98CTazUJRUo
 0sXf2QLvmrwxe5zlRS2vKGW/nn7k/jAsizin5pQyYwhlRTEuXwmFBmR/B
 83uilpMus/RJkrjsI3wPtGXrVC0q7y1+hQCJ4Lsn9DuTJ3WZcp6EtH7Zv
 AD8sW1XhG2cjCDPuOfsN2SabrOCt5DK6zjlkIj1cNEbduPptd6xaHg1Lb g==;
X-CSE-ConnectionGUID: IVPZ1n/GQTi3mYnJvWem1g==
X-CSE-MsgGUID: AtabmDDdS8ux7qalv4DbEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62477911"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62477911"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:04:48 -0700
X-CSE-ConnectionGUID: Tp0A9ADES3SMB2SCvJVLww==
X-CSE-MsgGUID: brrfoDn/QBmMKnp14JUIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="180969619"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:04:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:04:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 01:04:45 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:04:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qY8vicy91hIEAma1oCG1DXWrHdEGULa1kAflwphX4VhwrY7KKCBjWJ8HSORPIFfJYU9JJFxcVTuIH9v2lmUWSnavUgNmLnZ3nmkK01LnNg0on+6Xbw5qQ2iq3LxeISDrgjPEZAdJFg2hCoLaEfwjzOcHo4co8wp1bkLfpScEcJOUGAbrZL1Tc868on6V3gWjBD6W+C35cEwmeomwFi4DIVa4Rd91ASwnGgR7P5Y1u9Rrapmlc+7wTIoqLAdH7jbZLpsh9M0QJgtwx71XY2dn/+oSgqFm4qVzjLIMYjXvOxk2inEW84/34xOC8NPFKNazx1SvRyXtGQyS8rVockPMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/ymdp+dnRZFEqfkZQC924yHYVxdBG3i9iHUw3FwEFg=;
 b=JTQdCTrzZ90ztUfMqrSfa/3eaXXYLTtAcZ0mPDxZ1Cf5ec0ORVOU3DQNyV9EXhDBRXwfyhiNSseJ6Wjw6n+h87sQT4t9l6id8FPnYy/hMvPjh4ex0t1yhOKtkfjZlIfc/MMhiNohk5FtSl12Lukt3JF9beRhO1WygQOKt/UsGd1Ec9mqZNi3qq/gIT3TuHUhAWOyOoAzsj7lWhgJ6ghApQ8jB6lZNfCn+lDicW8yrL9gJrYaAJ9TQbMxUofaHQQp7Gp39YNUpR0MHs6MNWjNy076Sw+uEM34R6tPl8uzQznomuUZTvO9cHgETwxB6nv36ablRHn5L2Y4N9hWvTcY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 08:04:38 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 08:04:38 +0000
Message-ID: <e06bc7ee-e672-41b6-b911-51c90e73e8c7@intel.com>
Date: Tue, 14 Oct 2025 13:34:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/23] drm/xe/xe3p_xpc: Add Xe3p_XPC IP definition
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-17-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-17-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0088.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::9) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: d4600681-024b-45cb-6cfa-08de0af8524d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU0vSEV3Wk9MUEFCSVI3ek93SEJMMjFHbkF0V2xpZmtQUDN4NU4xdWhoemhR?=
 =?utf-8?B?MU9lT2YwVGVlQUUrR3I1RkwxOGpvcmNxT1crNDcyeU96KzUxQzZodHlUVmlH?=
 =?utf-8?B?OFJtOHhrTUVvbWQrZzdkVW04ZjE5dlpTdXZUVWlhSE1RWmZpM0Z0QUdYb1Fp?=
 =?utf-8?B?a2pvZHNNOENBUzhUKzFyS0U2YjRjQVQyVWJZdHdSdmtMcXE3TmhKTUdvWm9K?=
 =?utf-8?B?TVZxV3F3WlpXTU9mYXpFZXFlTnlWaVkrRS9xNnkzb2FnVXVKY2tHUDEvQThB?=
 =?utf-8?B?aFhqYjVSaUlQVGRWSWZSaDUrUGJaR0ZLbnpUaVdnZDF1SHhvekp6bWdHS3pt?=
 =?utf-8?B?QmVaSU12bXVwT3N2T2pEQ2gvSkxUUTRINDJRY0QyZE5icld3MlNTc2pDNmVm?=
 =?utf-8?B?VU5yTFRvNUtkMThGS3U5OFd3ZU1xNUNBRDNyK0k2b3B0QnFRSmI2aHh6elVL?=
 =?utf-8?B?LzhDR1V1NGhmMGExeCtPbk1pOC84UktlWnBkZjBTaXRlSk1sVm9EQkdxSUZa?=
 =?utf-8?B?UURMYk1XK2NjaStCSThOTVpKODdRWlpmdnFyRE1kek93RVNQMm9SdUFwUWlz?=
 =?utf-8?B?MlBwYXBSbWNKL3I3Y2NkYU95SnVxZkdLblI0ZnBRZ2Q5ZXVSN1pwbTBTa3hW?=
 =?utf-8?B?V3l4OXdaU3dlbWt0dkxaZVBwK0tRK2daSk1CM0FRb0d3TWFzbUdLdnhNR0d2?=
 =?utf-8?B?bWVVQTQzRmpLSFh4VjE5VERubmVXUUlYQTBOSkVZSXQ0OUJ4Q1Npc3FHL2Z3?=
 =?utf-8?B?Wkljd1U3QnJvaldDZTFVZXBHY29RRVc1OEJ6emd5TXZKdHpUZDJWemhZdVBH?=
 =?utf-8?B?bklxQU81VWp3SFgzYkprVkhhUnVQeWNmUUtDdGk2aHpRUlZDOWxpVXhKeFNJ?=
 =?utf-8?B?c3pFMUtubGcvQk5jMGROQVpUaEhtUy9wWG12eS9tdmEraFZnRWVqYWg1ZnNK?=
 =?utf-8?B?RTAzc004bVF0RlhQTUtZay8zclpvL0Q4NzlsV1NpcVI1dEc5OS9LMDRwNE9J?=
 =?utf-8?B?YTYyd0pqMTZrZW0zdWlaVnZwWE80eGtmcGwrdEVabTN2elBQWHo3a2tpYWZH?=
 =?utf-8?B?UkZQeXRYU0lVbnIzZ2lXYmdZMTBicmFyVEw5UzNoTEhjNWNiZWxjNlUxT0E3?=
 =?utf-8?B?TWNDUTRoL2pxQ0EyYjdHRHJndHJURUpCTjBTY2srNXlZa0lNZVNqemxUWExX?=
 =?utf-8?B?UGpjMktZSW5UdkFiUWkwN2p1MVFaYUVjTTVkbGt1QXpXek9DeE42VjFocWtT?=
 =?utf-8?B?cEtJODUwRU9maXdBRGNmazBKd2gzdjFHVVBCVUdIUEdrR3M1Z3dDR251cFJG?=
 =?utf-8?B?d2ZqWloxQTU5UnVsaC9VZ2phaW1ERkI5YXhvUlZVZmtNb1FMb3lQQ3VkSmhG?=
 =?utf-8?B?bEpUaXc0ejJBTjh2K1dMS2FFNHo4Z2IzZlhyNTZyZCtWVTdjcWRKZ3lUVTRX?=
 =?utf-8?B?cG11cnd0TkQ5SmtSNlJoSi85Mlc5NVhTL1h2b0hpSTNLT1o3bHp5WFFHZlRL?=
 =?utf-8?B?bUZxdWNUanc1WFZta3BONGM2MEp1MU9sTEIwZSs4M1IzMkpPNml5enhBZHNo?=
 =?utf-8?B?ZGRqTDNWVmhQUmVteFkvWlByN0VHM29SYXUyRTd5cDFzSWRNRUxJcjRmNFRj?=
 =?utf-8?B?c2FoYlVrbDV6LzFqZ0YvU1ZFcldtRGV3ZW5OUnBsVHEyb055WU5iZTZ4T0p5?=
 =?utf-8?B?bThEb1ZFWS9jdlAyWVNleVR1WXpZd3pWeHRmTGEyWm5DVERyYWlYWGZ1UGdD?=
 =?utf-8?B?WER1WG8ySmZtVndaY1IxRm5teCtEd1ZPbnRaaGJFTnJURytSdWFIcE5HQURr?=
 =?utf-8?B?WVVmcm45YkMrT3Z2SGQ0eWtyQU01WU9QZlpDaGV1Y0ZKQ25rdmI3QnFlb0JI?=
 =?utf-8?B?YjhSUzI2MUNmR3VETE8xVnJsZnduMHdMVlVVbCtiSUNod1FwcnpOYjFwbG5n?=
 =?utf-8?Q?1MiJzJFnfnPrbgeqFn8Kx2X0BZSoZ31H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09sMi9BV29EWXFwdXF4NmMzQVdDTmpNdzZsTHRTSllHOHRiRE5kdnhpL09C?=
 =?utf-8?B?YWQreldTOHdWSk1uZFhYUFQ0QmRxMllNK3ZDaU1hdFowSVFqRXlPOW1xMlNu?=
 =?utf-8?B?NmFLZy9FSHdXWitjelpLM01hcUZqMU1GMVl5cW5ObHR3c3BXTGZ4cFhWUStF?=
 =?utf-8?B?UFpUb09xeFBXeVVMQmJjTDRxalR1UGpKeldDNlZNZmZsYitZL0FuUXV3UU1I?=
 =?utf-8?B?OXVqNjJqSG5Pblp6TndNWjdNbTN0Q1NlcXBrbHlPQ2NnSmhmUERubjZvK05B?=
 =?utf-8?B?dVZSSFJtOHllNUJiNkdCOWk5WWFkc0xvc1RZbEtwMlcwVjZ0dXl4MFMrdStk?=
 =?utf-8?B?WnRyd2FQOUxEdHBMemtIdjBMSm1yZXNHMENYWE9NNk5uWWdtYjRSNW1iS0pq?=
 =?utf-8?B?RGxFQWFWOHNXNkYzK2Zsd0d0Y3hLSTU3T3JDYytscFBvb0xNTXl2UUJ5bUk0?=
 =?utf-8?B?TUxMeWV4OUNpTks1bmoyNGhhWWEya1p6UlBJVzdaOFJjNHpvTGVJODdXcWxJ?=
 =?utf-8?B?SGs4bm5EaXdCUXU3QXhjRTlXa2EzblMrRllZTDkycURDUXNDd3BLOU9aS0hk?=
 =?utf-8?B?VXRKUlFGaWMydlRxdlY0T05CN2F3Ni9HMDdpQmJsN2RacWhBQmJkWExROU93?=
 =?utf-8?B?K2gyWnN2cytwNStDOG8wSmdXbVVhcEROWDl3Q2lvT2RPM3RDRFhhdkxhY3ZS?=
 =?utf-8?B?OURicC9YeVUwRXdjb3ZTbFRsWCt5VENQbUdFNDBqWHVxQXdkMFdWdXpRM0pP?=
 =?utf-8?B?c2RvZnVyMERqZ2lMOTQ2TWJIOGw3RzJHcllDaHNZdWxQK2FVMFdxcmFuaHZm?=
 =?utf-8?B?YnI3VUt4ZFN3bS80N1V0VVJlM3pkYXh5U09lS21Qam1Ydy9GU3BFcDNLbjlr?=
 =?utf-8?B?MHpwMVVFYjNKZGI5Q0U5Lzg0ZFF5Z1JNSndUMDA2Vm1qdVZVYm5qYUR6MC9x?=
 =?utf-8?B?UWtlWTJUUWtqMFdoNzQxRXBKMDk3MFF6eDZRS21TdXFCdWJCM2dHbENtbEdM?=
 =?utf-8?B?VVV0QXROOTcxSUdvb3pHcU5VMGF1S1hNdGd2eHBzeXlLRGFYRmVHYVk2RG1Z?=
 =?utf-8?B?U25ZcDZOcVhzSGV0Sk5ESW1JZHl4REVEWjBhdytDcmNEUDhOWTk2V0lVZkFv?=
 =?utf-8?B?c051OFpFUGk3SzFxQ3pqc2l1M0FWSklyWXlvRUNJUXh1ZHRhVERnY2NkMDRW?=
 =?utf-8?B?bEZjYVRRanBHdWxuUTdTT2xQemt4Q0U3YkJHcWJlQUxuWXoySEx0aXMyZUMr?=
 =?utf-8?B?NXVwMmN6UU5vVm9qeDhNcVNpbTl0K1I5NkRoNTl0b1k1UWdOT1pVS0ZDTStw?=
 =?utf-8?B?SlRjVzZ2am9rZUtTVmxtVmJodkhjWUQwbmt6cGFIeTFXN3RGOEdYMnVROFRo?=
 =?utf-8?B?eU91cTA2TnVWcDJLVEtvZTFENFlLOTVuWDJFbHJLSEJHVzNkc210aGI2RFpr?=
 =?utf-8?B?d0hWRmxpM3NHYTVseWZUWHNqaHdVc3pidnlvOEhyeHd1NnNYc0xoVW9wU3Mx?=
 =?utf-8?B?cW9FcXdyNEEwSnZrYzlzRlE5WUtDNEFKNEhKcHd4T25INTFjanRsRklud0gv?=
 =?utf-8?B?K0xqa3lyTkNjQlNZRWNpazRSMFVXS3ZPMXlMVTRFZFoyTDNGZEFwSVV1Yk55?=
 =?utf-8?B?dGFWZFRaejVodnVRTWN5T1lQd1FUVEJteGFSSlZGWHNjYXF5L3E5MjRtQ0xT?=
 =?utf-8?B?QURWQ2cxUVd3SWM3TXBZeWMreFFlb1BUaXhlcVVSM1ZqdS9nMkRubmVzVWlk?=
 =?utf-8?B?N3E4QnIwQWFTZHc5QTNxMW01QjZocUNJMTBQei9maTllWitQQlY3eTloVWw2?=
 =?utf-8?B?eDJPRDVxdXFBcmk4cElBemFXLzNOUlBBcng0NEg5RE55NGtaQVpPY3lscGd2?=
 =?utf-8?B?dTF4SjNtSXFHOVhDa2lvci9TOUtsaCtOZ0xiSkRNRDdYdUJCZTFWdU4rR3ZO?=
 =?utf-8?B?R2RiUTY1UUpUQmZ6YllDL3M2WnVsTVhsWnFUQTVZQTQydjNOM0RaRWIyTjJz?=
 =?utf-8?B?S2pPZXRJUHlUUktTN3NEelNPZ1hXNm8wMGo5cWhXVFZGaERlV0ROS2E0dWNX?=
 =?utf-8?B?SlZINFRvYXNTa2FMSjFtTUN0RjIzTzVnVDlaZFN2T29BSEJPRU9IQ2E5OTFV?=
 =?utf-8?B?cURKM3E5R1VIRElxbVBqRUxyYXcrcVI1M1dwbHdnbG5xRFlrZWFmRUY3am9w?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4600681-024b-45cb-6cfa-08de0af8524d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:04:38.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMC+8BdohgzgPg32RUtvPmUd13+s/2cHK2O7HSzzif8DNpen5NbKZRDTMVuzDDBifq7ynhOk+ylM3Oj2op3hyFBfa4/vQbrHMcvTYM/x6lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>
> Add support for graphics IP Xe3p_XPC having IP version 35.11.
>
> Bspec: 77979, 77975
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index aa8359a4c5594..83e5e0c314a42 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -119,6 +119,15 @@ static const struct xe_graphics_desc graphics_xe2 = {
>   	XE2_GFX_FEATURES,
>   };
>   
> +static const struct xe_graphics_desc graphics_xe3p_xpc = {
> +	XE2_GFX_FEATURES,
> +	.hw_engine_mask =
> +		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |

In Bspec, I see the number of RES_COPY_ENGINES as 0, which signals that 
there is no BCS0. But, at the same time, I see SERVICE_COPY_ENGINES as 
0. So, why are we having a mask from BCS1 to BCS8? Maybe I'm 
interpreting the table wrong in some way.

But, aside from this change, other changes look fine, I can provide the 
RB once the above query is clarified.

> +		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> +	.va_bits = 57,
> +	.has_flat_ccs = false,
> +};
> +
>   static const struct xe_media_desc media_xem = {
>   	.hw_engine_mask =
>   		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> @@ -151,6 +160,7 @@ static const struct xe_ip graphics_ips[] = {
>   	{ 3003, "Xe3_LPG", &graphics_xe2 },
>   	{ 3004, "Xe3_LPG", &graphics_xe2 },
>   	{ 3005, "Xe3_LPG", &graphics_xe2 },
> +	{ 3511, "Xe3p_XPC", &graphics_xe3p_xpc },
>   };
>   
>   /* Pre-GMDID Media IPs */
>
