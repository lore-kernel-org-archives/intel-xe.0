Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C68C87FCB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 21:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E5010E050;
	Mon,  4 Aug 2025 21:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oILowjYy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BA710E02C
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754342529; x=1785878529;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JRkJQyHAOWfOAUJk8zGPUxDaq7xa/OfBaFJ2CuJ8ZDI=;
 b=oILowjYyqv2nZS/IUE4nvL9qs5oFG5C0fPaXbpaswm9CJnTWghm5fwXV
 QFuPjg/M3h6YCEWA6O37bLGXVJ/5zAksvrV96TfTPhdqVzZeOeryPmFm2
 GWuDHet4Z0KmbIQp9AQNynLfz5s1itDvMMhA6upe3aKgZaNXNVBUgEXhn
 gf3WfHZMp6+3kKL4q3MWVJTAE+gc/5iz0EQAzidNrT+tyFGSqS2aPAZsR
 3rIY53yM4QMGT1qD8dZEL+7rSDRPPw5/OSv1tddLz9JBROwZ224/dQgv6
 5hZDXXovt4S/F+qQDY3s9B+fLRQHT58jFQER+4Y6Nilc8IjEhQ6P8XgEe Q==;
X-CSE-ConnectionGUID: AmrlHKJfQrGYHpzHR1IaBQ==
X-CSE-MsgGUID: 3hwqKZlgRvyJZ53/MzTXhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60452287"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60452287"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 14:22:08 -0700
X-CSE-ConnectionGUID: pdbDgb9YTGK2mb/LprJCvA==
X-CSE-MsgGUID: bBWY07/XQ/Kudn29zkIZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164191721"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 14:22:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 14:22:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 14:22:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 14:22:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtaTEoTAfCrrThjl+TC4fWFH6VM+CE0G9gbosnoVcrc+tPVcNuSBv6qA8tZTZSyvk8ypha7VwgMxZvVna2u/z6nGxnerQEFDtRe04oCsirENWQirkHCFjcEovH4nCVITJ4lWbFzHVYefEX6A4WO8ul/JDMJ1CXvMCeklcY39zPLeVT9hKjAxD6X9roH1UuPfzM/Ku07/e0G0wZytCTyuIz109A0iK4n+yLKUMRl56sw/+BYAqESHI5Jd8RO8tvX6JIFF4CUOz7tKBObMzVcJW1N+tQbffRh1XqfvIJZdl6GhnjaHvTlTCFsAF3mC9oQxZBE2I1RYeTUyHFzx6qoHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSCjvfaFqKYm9rvb0IIM5RByOAMoLAu+wq56wsfb0eQ=;
 b=bunwc6FXvYfoxIspwjNMbIq+EwwAfcgthHmzYiK/ZzJOvcVasfuWIenwwrbBSEGVuegxGmfvuFAZ3tKkxHuvZrUtm+pzD6BM4O7iNvw+qk29J4PV7Tvs+05ZYpV5ZJzIs2Q57qbbKLfNggxqZktXm2bM3OjLjtGUMlEAJJwr0h9NtYQDdF4cDuV+XKYruuFYjh2f9iJH/uj7jApab6Y0Tg2fmefrJdfPKVwloDYbX6iKQp5hoLd3Ey+UibUNRezja4Dxj641t8KYYAhTkVTn9FHN9LjDtIFVEQJSEnIsURHu9dFXnwfTw23YbloNEGo4KyHb+Az/JbaPPF4Gxu/1yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 21:21:37 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 21:21:37 +0000
Message-ID: <606df984-4a0c-4987-b3f8-3fc4d9850213@intel.com>
Date: Mon, 4 Aug 2025 14:21:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] drm/xe/guc: Only add GuC crash dump if available
From: John Harrison <john.c.harrison@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-7-zhanjun.dong@intel.com>
 <b4662514-7a7f-420d-9d80-6b52d84e2e27@intel.com>
Content-Language: en-US
In-Reply-To: <b4662514-7a7f-420d-9d80-6b52d84e2e27@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:303:dc::28) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: a958014d-8b65-42b3-31fe-08ddd39ce55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFdWVXRpenlHRGlIbkQ5OXR0ZGVpUTNEajA1ZFNJbkxVcUVoNG5RV2F5dnZm?=
 =?utf-8?B?S2hOdlBMeGJ3UjU5VTZLcGxlbVY2SXR2emJ4Z1dQWmMvOWlmSmc3cW1taG5Q?=
 =?utf-8?B?Z1pCU0pDTkgrU245cktSRlptYjNuRDZHbVJyTk1WNHpNV09mazRVT05SNVJv?=
 =?utf-8?B?RStiTThPODNwSkFxV3h0YkM4NkRIZDlrRk5EOWRyWTN2WXlneUtPZ2o0cms1?=
 =?utf-8?B?KzhRSE1RcG1vNDV1MGhYNTJKcGNXdHF3K0NUSmg1SE9TZWM1RGpwdEl0V0tQ?=
 =?utf-8?B?bUFHL2NFMmphcmRYSUxISytHRm1VVGhjblVJcVdBd2V6Y1ZEb0E0OTJVRWd3?=
 =?utf-8?B?aDdtRkxlZkRiRFlNejIwYmJ6VG41bVFCSW5vT3prb3RKUVVhQ0RiRng0NFUx?=
 =?utf-8?B?NFEzMWNkVTk3Mmk4aElFcmIwUVM4TEpCamRqQ3BQMU5HSmNCTnJOYnVzVFl6?=
 =?utf-8?B?ZjFDb09FMEtqd293aDVYN3p3OWZJR0JqOXdsOHJqMmVXdUVldDVkbE1Yb0du?=
 =?utf-8?B?TFh5T0JSM3hjckhiaG16SEM3dUI5QStKMGkxM3l5MU9xams2WkhPU0dsa2tR?=
 =?utf-8?B?cC9oKzJXSFBRd1dnVUt6M2dmOUZVaFhia3NaaDNhR21YN20wNFQvV3BxcEtp?=
 =?utf-8?B?c1ZvY1ZHVzREbndsSkduamgxQkx3cGNhZEdlVEs1MFFZODFHSTRaM1dsVHg1?=
 =?utf-8?B?SHltMnoxZmVqU2JhWkFZOU5ra2c2VVREbkVDWERUNUltbm5NUy9HamY3OTBO?=
 =?utf-8?B?YzV3WjZWNldPb1pqejRWM1FEaTUyNjBhMktrbjByOS9QTnZGSDF2ZVh6VkZG?=
 =?utf-8?B?ZEFVRXZ0WDNHakRNcHVZTnZTNklPU0RXeHpjcUZqTTdNWjFOQ0VtdWRvbEdj?=
 =?utf-8?B?SkJmOWpCRmdia2hGWEdwQ1E4Ukk2ZVJxRzVkb21GUll1a0VSWEVyYUNaSzVD?=
 =?utf-8?B?V0gxUVkwZDVMaDBwV0Q3YlFXM3hGSEhiOFRGZi9XM3pBOTdQK3grMndrKy8r?=
 =?utf-8?B?SDNCK1JUTld6V1ZGazQ4ci90cXpJY3hvYUd4VXVJbm1Mb2dlbE04Smpvdytm?=
 =?utf-8?B?MXhVa1BFQ05YeDI0VCtjSnBxbVIza2wxblEwNThDQjlSSkRNY29xcVRFQjlF?=
 =?utf-8?B?MTR5YVNVdWoxR1UwRW9ydU12WTY4QlBzbzNjNUE1azk5dnJHZUZNRWJLbnJI?=
 =?utf-8?B?TE1lR0hSRy9ldHBzVVQ1U0NjMDlwbjdON3NqYktxMVdva0k3SkN6YUtqQ2JW?=
 =?utf-8?B?Um9BSTdaS0pGeDBvdytZaSttRk0wK0pCQ1JWU1NHTUh4TDNxZkJJZTd5cEp2?=
 =?utf-8?B?Q3h4RmZPT3Exbm14cHZtcHdkZ3FPb210dzVQUGhVU2NOMDlPRm14d0w3a0E5?=
 =?utf-8?B?b0hMbmhxM29iMnJTN3JWMGhVdVJXTnV6YThTOFZSUkE4QmlNS3VxbEhLaU5m?=
 =?utf-8?B?RDVmOEtZOU9FL25QZ2toUnIrSlpOYVVxdlpCRmh5c1RSeWNCN1ZJMDNnYW43?=
 =?utf-8?B?VmdVZDNMbVRsZG1mNzYyZjdhd0JNcXNwZ053RlFaUzVPUnZRVkFIZU84cnA2?=
 =?utf-8?B?d0cyL21tYkh6bjRWbjh4THNabHk3ZHArdm1SMklUMFQ2bExwWmdQZkFwZ2Fz?=
 =?utf-8?B?NVlxOUZzcGIvT2VsYnRwK3dqWnh0NG1xdG1sMW9wdEZRcVE1WUJvb3NMb1VO?=
 =?utf-8?B?OERiNmthR096RmY1ZWJSdXhnWXhZeXNxRVBGVGVYQjJmTktSVjRVNWFkWlg3?=
 =?utf-8?B?d0FFWjJmOE1MYkduT1hWazBRRXBoWGhLeFdGSE81RmhTUHk3TFlTRVpHQWli?=
 =?utf-8?B?WFFVT3ZoQ2ZJTmF3cG5HMi9PN0hWeEpBZHFpRG05dkh3S3JVQ0Ribm9FNU5E?=
 =?utf-8?B?UFpDbW9MZncwbEhXL0hiMmgxYTVoZzRGTXV3RTdnQzlKWjVldnhOVlZHQWF1?=
 =?utf-8?Q?dNshBkHlk9A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnQxVk9rNUJFa2Zvb3BMUHIzZXE5WVExTVZaYnJPMGFPV2xZVjlYR2dlVTdm?=
 =?utf-8?B?T0dVVnpGTHUzMUIvZnJnN2xjQTRlMUpCMW5jU3kyd3NsdExyOXl1V1RQQUtl?=
 =?utf-8?B?SVJldy9HdzEwc3ljUGl0UVI0Qk9Mc3ZtbEh0RlRQN21XVG1VcktIREpEaTM2?=
 =?utf-8?B?UG9YVDRXUDk0RExmQ1J5Qjhva3BDRlVFV0lGUmM4Z3cxQUFFc3VUTmcwUmIz?=
 =?utf-8?B?UUROQy9EOHFwRmZNU25lVXJGVFBwckN4dnZFOEpXQWUvcWlWMjlhU1lnV21r?=
 =?utf-8?B?aWt5ZWsxQTJHY1V2UzlaSlNuS3h4ZklXYWhFTGtjVjdEekw5YW1EeE96SUwv?=
 =?utf-8?B?bTd4dXplS3VqdlROMURicXFzM2szWXVqYk4wR2tDOEdIRzAybmNVOWQ5aCtI?=
 =?utf-8?B?WEp0MHFjTi9pNXlaYTVYS1o4ckN5K0s4WFAvdUUwWkxzSDlvR3RHWkNNWFpE?=
 =?utf-8?B?SDA1enVWWUI0YjFSc3J6dHFUakdoOFgzOHhSR1FXMXlWZVlhQ250RUl0cGlr?=
 =?utf-8?B?SnpqNllycWdjVEdTYzdTb0hoTG5CR1hibEkzR1dPSEovZGVkRUlhbDJtRTBp?=
 =?utf-8?B?eHdSZklMMFFyS3JUdmZlR1hWUW44MUtaNWEzTVRsYWFLZXJScm93Q1cydHZL?=
 =?utf-8?B?dG1ZSGtaQW5oSm52VFNic2pFS0ZuclZRRzZmYmZXZS9pT3VTZmJZZTZBS29w?=
 =?utf-8?B?MXJPbzJKN0RDK1ltN0pzTUFkN2NPazBuMm1xNjdYdUJVZ3d4RktLdDI1aW9r?=
 =?utf-8?B?SVlYemhzTDBPQWc0U1lLVjYxeFRja0RtQm9hT3E4Sy9tMjZBczdMQUN4RDg4?=
 =?utf-8?B?N3Q2TUROTTFTZG1COGJjY2tGakZ4Zm5qRXN2R2pOR0xGck5UNmozUVp4VitK?=
 =?utf-8?B?MmU0VmNxQUJBYmpLSkdWMFdsYzFkdVAyRE9IZ0w1dVdPSlZodE9mMzQ3WEdh?=
 =?utf-8?B?anYyeVM1RDNPRWJ4akhmV0lOQlVVRWVtSEsxSE1HM2pMTzlRUFltRXlWSURK?=
 =?utf-8?B?TmN6eDBrbzA0ZzdrWDJrSVpRMDVnY2tUU1lLNVErZTRsN2NzYnhDVEk4M215?=
 =?utf-8?B?elh0MG5GRW81YmRUdzVnYS92RHpibkpUT1h5ZGR3UUZwK0l4Z3ZWbnpjOGtP?=
 =?utf-8?B?L1g5NnZCSCtvMWdFSXpXU0xkZmFTdlpCR1FMWVUvM3FCa2xEZ1FXRVpvbnpD?=
 =?utf-8?B?V0E3a2svYVp5N2dJVlczMlhKd29NcjFGb2JPSjVlVUl3QSt1YWpFZ2tGanBa?=
 =?utf-8?B?clBXZTFjeGtndlA1aEhxVjRKM0xHemhXSlhESHpkeTJnNkVESGxBTmlrcVEw?=
 =?utf-8?B?cCtWT2lSQmIyNXlGRmx2OFExSGlxTEhEUE1WMlpSdVhwbEhpTGFqSmkxRytJ?=
 =?utf-8?B?ekNya0tBcUVpUnRielhvd3JOb1orTnAzYy9wTCtkdGtmY1VWV1ZuQkZNdDFJ?=
 =?utf-8?B?R1VYQlkyY25FTzgwSFMwbVErRDVqcGhEenV6djZ1OFpxOVlXNUdZd2lKNWx0?=
 =?utf-8?B?QXJOUnBNR0I4WmlqdEhXZVBBZXgrTzVxR01IM2NWQlcvWXJCcDlIYlJFc0lD?=
 =?utf-8?B?TzkwMlVkSnpGeUZEVUxWaDM3RHlwcEdLUzRYU0I0R2NVNkNDTmtCMUhnV2Zp?=
 =?utf-8?B?QTNEWkg5R3B1Q3dlVEx5R3ZQTkdjUjFFdTBTVmVkNGlqalFlVFZNTkZuYW5W?=
 =?utf-8?B?WXkvd0J0RHlFZ2VUWVc4Z1B0aVZ2R1ZYdlUyZ2MrYTMvYVZWMWxQUzk1Wi9I?=
 =?utf-8?B?L1ozb2JTbnFlYit1MUxETkQrY3AycmZMN2NuZ09kRm9MZG5pWkxKcFpjUVpi?=
 =?utf-8?B?Nms5VjFFZmdqY3ZadlFWemtJOTg0dGlIU2dpVXYvWUVaaElZMWRNKzJCV21l?=
 =?utf-8?B?azFrS0c0dFhqdFREcHlvMDJKblc2NnlpSnlUYW9hSmFJTERBbmtpM1RINC9h?=
 =?utf-8?B?RktTVmlVYWpub1FhajdzSXZlMkZaZEsvcXFtRDQrVEpBZUQzbDlZWG1pV09y?=
 =?utf-8?B?dEd6QS9OcXVFRWx2M0lNTFdFc3M1TGszMXpCWm9TNTNFNzdjdm52bnltRU8w?=
 =?utf-8?B?QUJPbW1RNXhQNGtYRHE0Vk1CV1RRT1NRS0h1K04wekJ4R2hzOGQ1UWl2QVpZ?=
 =?utf-8?B?eTFyd2VvdGJUWVdRK1VTSG1ZdWRvK2wrRWVncURvVkVOVGNGN3lZamlDQU5E?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a958014d-8b65-42b3-31fe-08ddd39ce55c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 21:21:37.3817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBTcD7iNQZ1bazHzlrk2OjYOa/P+DGoXoJS1QQfnWM7C4cCUPZrfTSyLTjnBMj84CEfeCfBT2qtrR8o0iw8mpSNgJkI0euaMi2lSIHtx+sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
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

On 8/4/2025 1:14 PM, John Harrison wrote:
> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>> Add GuC crash dump data empty check. LFD will only include crash dump
>> section when data is not empty.
>>
>> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.c | 60 +++++++++++++++++++++++++++++++++
>>   1 file changed, 60 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c 
>> b/drivers/gpu/drm/xe/xe_guc_log.c
>> index a8910211c579..f5f31f15e7e3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -502,6 +502,65 @@ xe_guc_log_add_log_event(struct drm_printer *p, 
>> struct xe_guc_log_snapshot *snap
>>       return size;
>>   }
>>   +static int
>> +xe_guc_log_add_crash_dump(struct drm_printer *p, struct 
>> xe_guc_log_snapshot *snapshot,
>> +              struct guc_lic_save *config)
>> +{
>> +    struct guc_log_buffer_entry_list *entry;
>> +    int chunk_from, chunk_id, to_chunk_id;
>> +    int pos, from, to;
>> +    size_t size = 0;
>> +    char buf[GUC_LFD_BUFFER_SIZE] = {0};
>> +
>> +    entry = &config->entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH];
>> +
>> +    /* Skip zero sized crash dump */
>> +    if (!entry->buf_size)
>> +        return 0;
>> +
>> +    /* Check if crash dump section are all zero */
>> +    from = entry->offset;
>> +    to = entry->offset + entry->buf_size;
>> +    chunk_from = from % GUC_LOG_CHUNK_SIZE;
>> +    chunk_id = from / GUC_LOG_CHUNK_SIZE;
>> +    to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
>> +    pos = from;
>> +
>> +    do {
>> +        size_t size = (to_chunk_id > chunk_id ? GUC_LOG_CHUNK_SIZE : 
>> to) - chunk_from;
>> +        u32 *buf32 = snapshot->copy[chunk_id] + chunk_from;
>> +        int i;
>> +
>> +        for (i = 0; i < size / sizeof(u32); i++)
>> +            if (buf32[i])
>> +                break;
>> +        if (i < size / sizeof(u32)) {
>> +            pos += i * sizeof(u32) - chunk_from;
>> +            break;
>> +        }
>> +        pos += size;
>> +        chunk_id++;
>> +        chunk_from = 0;
>> +    } while (pos < to);
>> +
>> +    /* Buffer has non-zero data? */
>> +    if (pos < to) {
>> +        struct guc_lfd_data *lfd = (void *)buf;
>> +
>> +        size = xe_guc_log_add_lfd_header(buf, GUC_LFD_BUFFER_SIZE);
>> +        lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, 
>> GUC_LFD_TYPE_FW_CRASH_DUMP);
>> +        /* Calculate data length */
>> +        lfd->dw_size = DIV_ROUND_UP(entry->buf_size, sizeof(u32));
>> +        /* Output GUC_LFD_TYPE_FW_CRASH_DUMP header */
>> +        xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
>> +
>> +        /* rd/wr ptr is not used for crash dump */
>> +        xe_guc_log_print_over_chunks(p, snapshot, entry->offset,
>> +                         entry->offset + entry->buf_size);
>> +    }
>> +    return size;
> Can't help but think that this is all way too complicated.
>
> The crash dump buffer is never going to be more than 1MB. And that 
> size is the smallest we can allocate when using large units in order 
> to get a larger log buffer (because the units are shared). My 
> understanding is that the actual size used is only a few pages 
> (currently working on getting a definitive answer from someone who 
> knows). So it would be far simpler to just save the crash buffer to 
> its own single, contiguous allocation in the snapshot with no chunking 
> required.
Just got an answer back. The size is needed is 12KB currently but will 
shortly rise to 16KB. So a private allocation in the snapshot will be 
sufficient and is definitely going to be simpler than going through the 
chunking stuff.

Unfortunately, that also means that our current default of 8KB in 
non-debug builds is too small! Can you post a patch to bump that up to 16KB?

Thanks,
John.

>
> Then all the above complication disappears. You get a simple "for(i = 
> 0; i < size; i++) if(i) break;" to check for empty and a single print 
> buffer call.
>
> John.
>
>> +}
>> +
>>   static void
>>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, 
>> struct drm_printer *p)
>>   {
>> @@ -522,6 +581,7 @@ xe_guc_log_snapshot_print_lfd(struct 
>> xe_guc_log_snapshot *snapshot, struct drm_p
>>           return;
>>         xe_guc_log_add_log_event(p, snapshot, &config);
>> +    xe_guc_log_add_crash_dump(p, snapshot, &config);
>>   }
>>     /**
>

