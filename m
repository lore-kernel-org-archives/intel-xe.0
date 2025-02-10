Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF4C0219B
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 08:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A99A10E4C4;
	Mon, 10 Feb 2025 08:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRhxAU2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276B010E068
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739175495; x=1770711495;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=WfPPaYhtFPso40ximeHHk7SC+/VP8FmzA4/6JbqMYmM=;
 b=YRhxAU2GgiahlE3m26wv8jaTOj0fC1jZNyU4+Cyw7cgLqbu6WPYXw8Tt
 pgXXcF2gMjgeiAXeI5GN0U60NLssfym9tpm16RAai9RoLqT+P0U9qmkXX
 /8zyfVhXmD7N0qu+H7dipE93clMWysohUpGNCAgqy5wWyc3wZTmfwGobT
 HfBNIhfVqM0FeVDiz+RBgIR9W4zyiLapA/OheoHVb/sRnXdgdHST2wj4B
 4nXaQg2Wbn7iGpVXeUA6S/Vq7SNnUXyu5pXO9KP3Fc/DvLB2hpbK5qfef
 xq5H+GAebzZj/uSdRHuPh8hvParRVqfcgA9ZYSotkw96fCw7o5euoFXSE Q==;
X-CSE-ConnectionGUID: gCLdcmonQU+OBthHMtNnGw==
X-CSE-MsgGUID: c0trixS4TZ+wEheN+Cfnxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51136511"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="51136511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 00:15:59 -0800
X-CSE-ConnectionGUID: AIuLQpRQQKS0U2eiEY0rrA==
X-CSE-MsgGUID: +LC2+L5+S7K1cVOd+Y5S/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111956235"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 00:16:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 00:15:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 00:15:58 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 00:15:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tChGHuOQzvN7jggFl95p0P6wBz/r2udykyMw7nwL9FTq67Sa9diEOgscE76WOAuNXeQwxNYd3dNfzW1ix5mlKcN/3n93BCUl+un5z+RjNufjZRGfxt0DQ/8rVzw2YqwHUT4Pujz5tJQUr7vheVVtdA9V1d3jwLrV0KpdBizsTCf/EPcX01EDiEPBRNDmeAFg93qqTXAG8B9or1XBOxBrZ9Ykp2/YKEjS2NzY53OVg68PRGCFzysnGHXR6v3kOxsS7rVHqRSruoC215GGYNjY2DxZzHBeoXc/3gtmhUYWd9whjcDs9hyREGWhkvY4IMkRrF7p2+lSKw6+kN0f/nU+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZOE+Op1rICkP1Xf9bYjFtZym0mDs3dZluKN5KZkSP8=;
 b=M0tEd17RbVPQury04XkTeeMw2T/6mDsTloDVpX2o0MB2vMxC3ediwEjBQypJNJSd81+DnPPBCfRChpx5oP+MoMT8AQ9yk9lKNQp1T1tYVABYbYY8KDwy+GKwrL14O2LVZPbI3fmBs+giQ20H1Hooox42dS6T3Kos8WVyS6xvUnCWGi71fCd9ZN7FaHmMmEXvUzTCD4L5scBwTwiAjYHa/NSG1zV/cmcwYcq49YbfqeWsKEQ7Uk8U04sa8d/7VoDTCXUWghFMWs94XjtTyikuTzAuGzCEvBaKydet8fqbpGCHIQtkZCWmtqe/ZQPRDOKFbNX7rIe9Dp1rL380ZP+H+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 08:15:33 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:15:33 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/xe: Rename struct xe_mem_region to struct
 xe_vram_region
Date: Mon, 10 Feb 2025 09:15:10 +0100
Message-ID: <20250210081511.906452-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210081511.906452-1-piotr.piorkowski@intel.com>
References: <20250210081511.906452-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: c83985d2-6c78-4acc-15d0-08dd49ab1765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0VEVldzWENjVmpPcmhSM1lsMmxuSTlQRHpINnNWUUhwY0x0U2YzRUdOMzZV?=
 =?utf-8?B?d3U3d0NBRzZ1bVByM01Na1l1S2JJQW14WDNMdFExNnV2cDBxS0g4NGNmNURM?=
 =?utf-8?B?RytyYzZrc0JqajNoOEx4Q3dqNGY3dExiNzQzMkZEUmd0L2JTWWlDYittc2ZP?=
 =?utf-8?B?bGppNEhtWUpjV01KbzlRYTAzT05uRHRocFVtYVdDQlZTU09EeGxRY0dNTmpF?=
 =?utf-8?B?UHRrSm9lSWpIaFFPV2ZrdUwyUjZoNG9COHBvWkRzV3N0NUtHZVMxWlV6Y1Z1?=
 =?utf-8?B?WEFKNEZVS0NDTDdJYnk5amhSQ3g4VzEyOWh2dklWY25YcWw3R2pCdlNobi82?=
 =?utf-8?B?a3FaekNNZWhEdUNKL0R2aFAyUEdaNGZNMzhUUUJxRVVrT2tzemQ1ejQwMjBY?=
 =?utf-8?B?N3dSLzUwMnNXcEdXdDYxZzJuNlh3K0ljeFBOUTNhVFlhZkxxbHphaVI5aElO?=
 =?utf-8?B?TC8xTk13MkNobjlCdzJUK29IVEh6UlVrYm5lUVpiZG9aekN6S3F1ODlxSEdQ?=
 =?utf-8?B?WDlYTnZkUENyRFpEZ0VDcWxiOGJqNTFqY3hDeWQ2NG5LN2lqQThNVUM1V1FC?=
 =?utf-8?B?a3hKMDdORnJSYUY2cStHVkllTlNKSE9tQzFYRS9CVlhtYWRBWGNrRXd6ei9T?=
 =?utf-8?B?c0tNb0JhVmtFd3cwN0NDeWVwdi9nZlJvM1NnY0pkUHhTRWtkMExwN2d3VXNv?=
 =?utf-8?B?SFpUbFNsR05NeWZMU0J5N2NoSHlxaSs5ZFFWSko5OG5aRlM1QVBrL3AvUkxD?=
 =?utf-8?B?cE96QTNtN0ljZittck53SlhaR2dzbXdUbHJTTjZLVFZFNmE0RlhLNmZ6dFlm?=
 =?utf-8?B?YkF5MWdDS2VpSG8yM0VMRWpnU0pTa2ZEdGQ1NENDelU5QkJGUmIyRUZKMVJm?=
 =?utf-8?B?R3hyaFlhOVZTbGk1RFdNYnRlN1c4ODNyZTdIMXVBNXFOTDBmVVpLL2tGWlZZ?=
 =?utf-8?B?U0Q5dXRjNzdqV1lnbFh3VCtEdUYyUVcxcURMeHp2bGxXKzJjdktvbVRBcm1T?=
 =?utf-8?B?Z2pTVFhIcFRMVW9RMUt1VC9RQ3RBUTg0aWhNWGtaTWZRRlFMMUJwNUppK1ZE?=
 =?utf-8?B?WUlFZ1Aza0daQ2p1S0ZGTENUNkd2QUljQnc5TEVNdjVibmd1WkF1eHc4RVdp?=
 =?utf-8?B?ZWlnZTNveGQ0N0VjZHRrWXVFUXF0VmVXQmZyQzNxRklQV1JzTVd4N2xoY2tJ?=
 =?utf-8?B?SkVWYTFNdHV3YjJTcDRwMWllNkk3VDRPVlZDclRnSnZpdEl6ZE5rNHBmWWVC?=
 =?utf-8?B?alZOQUVkazlVTXdXYmU4eXNvWFlGNEZVOUlnT3hGOTJVWDRXc1VIcERQaUlw?=
 =?utf-8?B?V2VONnR4dG9ESUEraHZ0Ym1TMmZhRVFCb3JydXZITXpkVGlFUklYSXV0eERU?=
 =?utf-8?B?Wm8rSUpudnZmdzRTVS9PR1Z5VDBZWkJkdERXVXJRUUNiV1ZHM214NExQSmh4?=
 =?utf-8?B?OStTdUErWDRuQVBXNG56NkhaeHMxbmsvemp6VDk3UjJveVQ5VFJsdlltU2Vz?=
 =?utf-8?B?TTA3VjhlZTFZb0gxVHVqYWNRN3A1ZDMzcEgrc1kraWp5T3RUUnYyL3AxcXhG?=
 =?utf-8?B?KzFjU1lIVUZvRkZRNzFyMkRLUnlaRHVOb1lUaDNsQy9NUjVNb0prSDhEejlz?=
 =?utf-8?B?OHAvdFlqMkgxZzJ6cEZMM2FvYUQ2L1dnVHhQS0VKeDM2bnNLcnlzS2JxMjNj?=
 =?utf-8?B?UTA4c2lINTgveWxqdkpsSTVLTmRVU1J4cVNORWVCNXpkWU8vMFRtSGtQdWFo?=
 =?utf-8?B?dENyOU9hSytwQ2NOc0d3dmtrUFB1eCtCeFFtS0tYWmNUMm5vdjdxeU92VGsv?=
 =?utf-8?B?dFg4UDRqWGRVRWFhVkNqcERrY0llU2VBcmNrOVBxSnFTMmZBa0xJSVlXRU9K?=
 =?utf-8?Q?VMc4kMeYk4anY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTA4T0p3SnNxY1JKWkg1VXNCcEt5akQ5Ti96Ukw3NVhvcDZvVjNxbWlxSVFm?=
 =?utf-8?B?T3RPS1ZwLzM1MkU2blF3YzE2UXAzMGNuUmhobnlrQXlNQ0swcVdmeloxbDhM?=
 =?utf-8?B?K0dkUlVFQ01mUm5kVHRUVVBDQjA3SVFOdFM2K2IwUTdnNkNXMEZuMUl6Z20x?=
 =?utf-8?B?T3R2NmZSWldLYm5DQVBQOGZlcE5ERWE2Zm1qaE9NOTB5c3lFdjdlUzFvell5?=
 =?utf-8?B?VlZFUnAyNk9OQktWS3l6UDMyVkFGdTJOcFY2UWVCZnc1UTNvUlhRU25RNEx5?=
 =?utf-8?B?ZHMvcE1ZdzRvQ3FoSGtGYVZaTURobGRseHJPM3BNQll0REpwMWx2NjVyTVZo?=
 =?utf-8?B?SWYrQzZ5T25YTkRTUVZzcExZaGtrRFIvaHpPUFNZSTU4azVJUUwxanZ2L3Ns?=
 =?utf-8?B?VnZwR0tmVXNNUGR0cHA3WURxRHNLNFp5dkNPWHluOGtra3NTUHRnSWw4ZHQy?=
 =?utf-8?B?WFk4Z09zN2ttTVlUVnVENllGVy84QWhJVUVsR2dEWldzUnBBRWFIWHF6VFRD?=
 =?utf-8?B?RGNKL0hlb21GZFRrZEd3QVNKcnBySGk1ZVRmYnJzYzBuc0VOZmRVUjMyWDQv?=
 =?utf-8?B?bmZuQkVpRGVFZlhodUpPcXNUOERUaTRpdlo4NDNiUHRYWDRtckt3TlZ2ZUlN?=
 =?utf-8?B?c3NoMHcxWTEyS3pvSlVCVUtBMUdlTmpaVThnRjhUWjNGSmlUZ2hFMGtXVFZD?=
 =?utf-8?B?RXVsOCtvamQ1aGF4S0UvaGZPcEk3eWs3OGlHYndZaStxQklsNW1SSlVOcU0r?=
 =?utf-8?B?Q3RaVHd2c1J1N3YvNE9lR1VsQ1FnZUtBTFh5bmM1Mi9uZm85Q3NScldCditn?=
 =?utf-8?B?MXAwMXpwS1J6QllTQmlSdEJLcytuOVp4UGRYc2Z2U2FNOXVlZFM2WTVKRVpQ?=
 =?utf-8?B?bS9JM1I0UHBGYW91THU5YUJNeERJK21BQlpNeTRXMTd4WllUV2V3eFdQQk9h?=
 =?utf-8?B?c25Qdkl1ZUYvaDVIeUFDNFRvTjh3WUhxdFlkRjRoVVU4YTVUNC85MkhwRHVv?=
 =?utf-8?B?MUFnRzJLeGhyNlYxNUF5cWIvblNja2RQSngvcEROMWNZNE5ocC8wZkZhaXRa?=
 =?utf-8?B?bHVDWUZySGNXU0tEc2R1S2wzMkp3UnczL2RuQkhqUzVWQ0NaVU1LL2tScnpR?=
 =?utf-8?B?ZVdIMlFiWlV0djRiVk44NFdvOFpqMDUwa2ZBYWdUdlhXbnRpZlZMcFdhSWFK?=
 =?utf-8?B?UUNuS0hnYXAxbDMxbkdWUWVLNk5FbktpYTN0Sm82dnJTSUV4MVc2MGZCN0xj?=
 =?utf-8?B?MlEzSEcvUlBGb0s5MEhVSHVEMldRR2hjaGtJbXZJQmZITUt4RTUrSytzLzhv?=
 =?utf-8?B?ZXdoMFNhY1NQMmpTTU1aaGtocERDWm1yVjQ2d1VNTHV6SkFBZlFiWXNRVUFX?=
 =?utf-8?B?RjVnb2h1V3lKL1RmRmphVFZFSGk1SEJybXJmeVF5QmlKdldvb3BuYnU2c0t3?=
 =?utf-8?B?UjRKN2Q5bEJiY2YrVUY5N0gxcmtwV0l3UUljRGJnN2FtWnN0L29UUU5vbWM5?=
 =?utf-8?B?VGpRSzVYTlRFR3BNc2Z1Z3I5U1dndzJ4VkV6bkNtNDlOL1lKbFRMNXBjd2Nv?=
 =?utf-8?B?QWR4WENFNlluWkhaUkg0OHhZU3BCSEY0akM2V0hRVC9YcUtwWGdjQmVBdFpw?=
 =?utf-8?B?VElwMys3ZmoxZWhOQ2l1RVJkZEFsaWNqM1ZhTFZaSTNET01rM1p3a29yTnFo?=
 =?utf-8?B?YmpWWENLcDdnWm5WT1pmcmRLOFB0Nk53Y0VpeEVRSmhGMW5jQ3g5OE1icjV6?=
 =?utf-8?B?aytkLy91KzVid3A1bUZaS09iOVhOeml2UnphSGdWZWh1RytWS2FQOUcvY2t2?=
 =?utf-8?B?M3RrMjc0UFdad2tPQUIyNG5XeUQ3M2ZtZUNvM3R4dkxHOUNCS3dDV2xhdXdn?=
 =?utf-8?B?V2hEYUcwRjJ2S1R6VTI2N3JyVkhEQUYvT0xGVGRvK1A1eHJZQ1RoOXo4Yk5a?=
 =?utf-8?B?K25zdWNKNnpRc1RCMGRpMFdnVDIwUzFTZTJsaWQ3d3Y0S29TMjBTeUdXMDhx?=
 =?utf-8?B?VWp1Y0E4YmRJRHVEVVMyUGtFbmNWOHgvV1lpNWlqTVM5bmVjMytuK2FmUnli?=
 =?utf-8?B?UTFmRlBnQUNyVjRCcXV5cjgrajJRZVVmMXAyeG9NOFV6TGxiTTRaT1BWVnNp?=
 =?utf-8?B?VzBDd0E3QTRjem5QTk9SWTkvK2VyWEpUZVpyWVIyUzAwcXZLVzhCOEsvQlJM?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c83985d2-6c78-4acc-15d0-08dd49ab1765
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:15:33.8550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A8YZA0W3Q0V3+8iovoAMErYf5tM4s/isPdMvr9h7Z502k+vmR6OHwaDa3fgjKzdEHFofiN7SdGEOanOzgOvphkJzJcxLR+xVPa49Pfqwe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The xe_mem_region structure has so far been used only in the context
of VRAM regions. Also, the description of its fields clearly indicates
that it was designed for VRAM regions. This struct is strictly related
only to VRAM.
So let's be clear on this point and rename it to xe_vram_region.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 12 ++++++------
 drivers/gpu/drm/xe/xe_device_types.h       |  8 ++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6812164e1470..a202d5525822 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -143,7 +143,7 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 	return tile->migrate;
 }
 
-static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
+static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
@@ -179,7 +179,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct ttm_place place = { .mem_type = mem_type };
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
@@ -468,7 +468,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_mem_region *vram = res_to_mem_region(mem);
+		struct xe_vram_region *vram = res_to_mem_region(mem);
 
 		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
@@ -815,7 +815,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
-				struct xe_mem_region *vram = res_to_mem_region(new_mem);
+				struct xe_vram_region *vram = res_to_mem_region(new_mem);
 				void __iomem *new_addr = vram->mapping +
 					(new_mem->start << PAGE_SHIFT);
 
@@ -1025,7 +1025,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_res_cursor cursor;
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
@@ -1165,7 +1165,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct iosys_map vmap;
 	struct xe_res_cursor cursor;
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	int bytes_left = len;
 
 	xe_bo_assert_held(bo);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c0e886bac183..1f27ed2c0448 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -70,11 +70,11 @@ struct xe_pxp;
 		 struct xe_tile * : (tile__)->xe)
 
 /**
- * struct xe_mem_region - memory region structure
+ * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
  * device, such as HBM memory or CXL extension memory.
  */
-struct xe_mem_region {
+struct xe_vram_region {
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -197,7 +197,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_mem_region vram;
+		struct xe_vram_region vram;
 
 		/** @mem.vram_mgr: VRAM TTM manager */
 		struct xe_ttm_vram_mgr *vram_mgr;
@@ -369,7 +369,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_mem_region vram;
+		struct xe_vram_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 	} mem;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index f4a16e5fa770..a8c37fb4fec0 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_mem_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = &tile->mem.vram;
 
 	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 2d75cf126289..4c52ced4ee44 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,7 +9,7 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_mem_region;
+struct xe_vram_region;
 
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
@@ -22,7 +22,7 @@ struct xe_ttm_vram_mgr {
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
 	/** @vram: ptr to details of associated VRAM region */
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
-- 
2.34.1

