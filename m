Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D5CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256E510E438;
	Wed, 20 May 2026 23:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKQFMD8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1645C10E428
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 23:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779320414; x=1810856414;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sHy25KupoFRAfZrMzXmpYv42NxVu23ZsQp64hzRHCsY=;
 b=KKQFMD8S3iiEPKjhxR5FCUM4gF3XKMwo2052wgUqYMUXex3spaHcb1qr
 qhIysMooH16Dvwvg/VgVhVI38KeqIZk7/c+xIf4jsQE1dQjpyu2YIr88d
 +/FOzyhn9vbiYgft6wtXZScBWUZgoH4l6GOOVPtGO9HVosQJNqQ83nAqr
 cdrpxmz3uwyrcYlucj9nWDGWnCz7W+tpczw0Fi00izSjOI6YATAO5bv/E
 fy+dfOCCp4niBc8mmAZmW4sY156SmfYjGwQBOPYlG0R5T4RgTm6ZkdWvY
 1ywBFGVHOWS1BQH5XQlsT8iwkUpDuWXMr/NfBmKrkalLz+aiybgU/yau+ Q==;
X-CSE-ConnectionGUID: RmaXlKMyTN6aqH6pikVPyg==
X-CSE-MsgGUID: hOCFWJmmS+KpiqGbmZel6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90811014"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="90811014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 16:40:14 -0700
X-CSE-ConnectionGUID: 6zdVsuTTRL2SMu1yIHJPOw==
X-CSE-MsgGUID: gx2WDazCQ5+BB0I3os068Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="245372322"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 16:40:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 16:40:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 16:40:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 16:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfvjV2DjdNvSvvkE0oN4ycR5Fc/YF+a4+Hw37l8nz1gxUyE7NUtfDHnkS428GWez4pq34tsSMaSmrqgpfvn9gbxNYjUIB6MPWgmzRLWpqcYW0KzHj2mLeRZfNWZzHtUFZOglB7MR9DZWLJpmO1KA9JmvpHXvkmHErD8zjltVe9rz0snf85F7tNWn64iRiNMwaX9tewkjvkIttzBrO5dTkqe3pfem4GEyfCPIANHHDkgivZEJoKxAiASo4KB++3iR6uWR11FKVnJGgW2A+J8eQ0NUflk7dXtCFI64C8Eook+tf+r7xkVfLu6NObdKC3UyIO3omWg+kHZoCtYSbGoTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43tmuNgmYVC8Gn0lC7Vb7Pv5KsNyZXROK+uHJhnkIvg=;
 b=FMxGK25WbI6jgRQ+AhlkwyZuPWwa7sO3fs6OPiHlFKB+xeVPCf/Mv8IOUax7H0b1TASJ4otSYAYGtlUvRRtOuE/7pdBVftHsvQhL8f9EGmsaZwsfFyCWNPrBfjMajTzZj3fYr8pBkzCq1nG+NejuGNRCUmuRFD+uhXnxlcirMiNPDIkV+SkgZ7yHGd/bv3VJ8XuRNXzs+3NuO2fTOqAQ8Tg2ev9ia+OTwfn+bc7S9+nJe470xW0EVjg3JMTnSf6CiUYWOOr8w4nhZ7S6UC07A/BEygKzhUyaUXZ5xo1KnsgSqL+7AC/kSBuElIpSOBRuXipYaJUTP73NxxkvNz1ZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SJ2PR11MB7670.namprd11.prod.outlook.com (2603:10b6:a03:4c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 23:40:02 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::6bec:e86c:e75d:5caa%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 23:40:02 +0000
Message-ID: <ad00e2f1-861f-4a64-93c5-cb08d25e1986@intel.com>
Date: Wed, 20 May 2026 16:39:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] drm/xe: Fine grained page fault locking
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-2-matthew.brost@intel.com>
 <9cb81721-5c3d-4c7a-8056-96c24027713b@intel.com>
Content-Language: en-US
In-Reply-To: <9cb81721-5c3d-4c7a-8056-96c24027713b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SJ2PR11MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5e321f-f17f-4d11-a860-08deb6c91ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: XG+cDhgG+hGbKXeJJehUcLE3OC9dth4rsb7LzkwwzFQMn66ccH+jgUGIWmx0h1hf2LFE1rVZczLQss0F0MpYrfHS+83rLIhDXH3GiuZ6V30rvFd+Ieao1M+gXYl02WaYgrjpJa3/0NZxPq7FYkoT+0P0WzplYj2xxVXVh9S8DHpRRtDdItLuSHS14NVWo92VQI0sWlDin3EBgq1RsO8K/nV9Hi5qpPUpEAmcR69Z8DY+AOpJc5+HzVyMrNFdUz/B/9oPf5sMLhNdarNQye8BsWPElxYb869n4ch3p/l7v54fQ3NK+YEw8u2Nv5tmQzDSgj17mnFvO77GowY05leRVMGXkcxmh8xOsT0jGGOB+2o5w7akEUB0PEABJwdc251+FB0ergVXDZpIhNSKWQE71QXAA4ysr14wZ/PAOcTIScPY2iidixCNiZuC175BP2ImNQam5xKDGNiFW2QVzuq4J4YZjRuLajc0VfZgYxY5WJ+vbsUJxZ1QrRD7GeYam89xmoTEAe7zDkQc0cPw7JzRvItyph8ntoXduVK/kbCBvqoFCNZI7UKsaUdeZukDLvI9gTsSVg7HivAYavLFL6MG1TbT+bTui7WgkzOJ/sG2vXKaforjeHVRYan8sEmaQYfWkl+9K3sNyxS3s6Uefp+vgKi7ELWcY002srbQ6o9XgQjEC/ZceOcxdYGoyEpW0MWb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZZWjNlZ0ZkWkpvYmlFcTlQVFQ0dE13UWp3bGlGN3VJbHRRZU45aVlibHRB?=
 =?utf-8?B?MlhmK1pOam1zUUQwMzl1Z0JOMUFLSjY2eitrRzNmRlRZOVNMckJKMTREQjgz?=
 =?utf-8?B?djdhNzNjMVp2WmtCSytiL1lUdXRMSDZzY3l4Y1J3OXJUNnR2N3V3c2h4MmNL?=
 =?utf-8?B?dnNqY0FSUXZNUWZRN2dLUlpaU2dOanZKRWZJSVJ4S3pOdW1nYUliRGJ0a0Nh?=
 =?utf-8?B?T2gwWjIxcWU3dWZTcnFJbHpPZnFzQzBNSWVEbVk1cjlsTEk3ZzlZeHJvQXBH?=
 =?utf-8?B?cXZ4UllhQ3VVbFZIVkwyeFA2engzTjZobnY0MXoyZW9ISWUzZHlXdDdTOW5r?=
 =?utf-8?B?dGVNNG91NVA2cVFFNDF3aGdQRm52K2l1d1A3Rk4xMHZHYWJXcmFyMHBRb0g4?=
 =?utf-8?B?Q3Y1S2VGbnJxbmFLWlUycnYzRUdDelFPdllBbkdSbzNRbHdkL2pDc1FrS1Ix?=
 =?utf-8?B?aXVBc2IzN2hYRzRhTnRpNURlWng3UzBrK2tnSFdHeHk1Tk0vSnhRZktCUWVG?=
 =?utf-8?B?bUtGaTl0SVdCWkRmV0JTM1EwVHZOTWdZWXhodGliSmdlSGhzUGE4czZORWxX?=
 =?utf-8?B?VEFxVDFDeGp4SnE0MUNoV1NaUE1DZ0ZFY1BOeGFrK096aGQ3ek5JQkRQTW5D?=
 =?utf-8?B?M2d4OU5QWk9CWWRqMTRha0RxOEdHRjJmUDVuYWIrRm56Rk9uZVBHaGRITGJL?=
 =?utf-8?B?Q1ZUZ2tha3Iwc1FWTzdqYmZ6aVdSaWtIeFBINCtMbi8wL1VMMFF5c1JGNU1S?=
 =?utf-8?B?TnVjWk01eHFpNExYaVdvK24xajcrOUZlK3JDYVNpU3dpY0xJc0c0cGpiK2VL?=
 =?utf-8?B?NEdBVlc4ZE5wUDF0STBvajYyQW8vRVNPaFF1VTZuM2lHdVNVMmt4dEtLRHFC?=
 =?utf-8?B?MjRMMTltTHkxcGFaNCtweFlJdDFzRDdwRWxWVytPK3JWcWo5UmQxWE9ZM2Z6?=
 =?utf-8?B?cWF4UVVZZEY4K3pGWVRwVTkrZit4ZkhEdFExby9uYjN2UDM3OFFaVDVkV25q?=
 =?utf-8?B?YURET1FaLytrR2E4bWlOK2t3alpKYTdPNUVRSmZCSEMzVis5d1dHY3pWZ3pN?=
 =?utf-8?B?dmYxdjhLZ2hBQU1oSEdsWlhVd3BRVEpaT2MxcVd0b2JEd09NYjFqaURpUE9n?=
 =?utf-8?B?d0o5VEdSU1lMQkhwUHk3Rlh6MHZWd0VFcllXK0grb2FSdmZvYURFSlFOUWlL?=
 =?utf-8?B?anZoUzZWU2xWMTZDVGZacTNYTFZOWHJxbkFrN0p2ZzRKUW4vQ3NTUzlhdHpK?=
 =?utf-8?B?YlhSenB6VDU0NVYreHpGUkVxd2xwQWs5aUpHRGQ3TTVSanRTcDFBcU9EMlJi?=
 =?utf-8?B?RFJyZ2Zad1NQdjJXcGoxTWxVV2lka1YyTWZuU3RpK1ZOeEFINHUxYmQxbnJu?=
 =?utf-8?B?cDhKaEhLNEJkNnUvWHlOS0g2ZnlUYlRhNDdJa1JNdGtaN2RxL04wcUphM2to?=
 =?utf-8?B?MDV2a3lUVzRXVGJxMmdoQ0JJQTJSNmFUN1Y4bnd3dFZheTNJb1VlZEJvSEph?=
 =?utf-8?B?dm8zeGhudjRJMG41WWg0SG1TRk01NmtiTFdUNFJRWUI0cHNVcUxEQUM4K3pQ?=
 =?utf-8?B?cGxRb1JGT29wbnQ1RUFsQmVyUUw5SUNXaUhidDV3VjZaZWMwR2p4ckNuTmhB?=
 =?utf-8?B?dEFVKzE3QjRHT0IzdjFQVDgxZ21reTJSNkJjRkRXdmlFa2dKMkFtUGJ2Nzd2?=
 =?utf-8?B?ZEQwdnRDek4zZG5GWnJVSkhNQlJVbC9hS3pyNmV2VU1pZFE2SlM1TndhZWR2?=
 =?utf-8?B?dmd3VTZqVXFwZlB0bWZDUms1S3ZyWmpBVGlKY3BabXJ6Ym5MMk5lZ1VrVi9m?=
 =?utf-8?B?bHFDKzZBL1F6UEdYYXF1ZVBjdWpHbDMxeVhHdmtSSTNuTkRJdEQvSk0rV3dz?=
 =?utf-8?B?YXZLenJPUXFMek1EcXdrRkxGdys4akRnWkx3RWduNHZKcHpDMERmYU1Udjhk?=
 =?utf-8?B?ZnJDVlFtVE94d1pMdDVCbG1FUC8vR1JDakxVcHhFdFNQMDhWRG9CWE15ZSt3?=
 =?utf-8?B?Zzc1K1BpZ0g3bmRObWxpd0xuc1pWKzlzWlhKTlJWT011bGwxUDVhWlczU09F?=
 =?utf-8?B?K0xocnhKY3pQekdaWTdGQXpxdExFcXZrNk9CRG94aEpxSlV3NjZxb1NUcmVY?=
 =?utf-8?B?MnFYT3YyQmlMNy9FV0hoZW5mQXVwK0ZxZlFwNGMvNnFOQUZxd3p5VllldEZi?=
 =?utf-8?B?R0E1cnBlMGxPSTJNR1d0WEFqeVFZVlUrUHBXRXZsNHRFWllFK3FIZjlGVVhk?=
 =?utf-8?B?ZHRIUStkUW5LWm5FWk1JSGIxdVMwWDZoYmhhT2hqRFFqNTlOL3Z6bGJxWVNN?=
 =?utf-8?B?OXZVM1QyVEZIdkdtYmhVdzVkaDBtcVVIcW5ZRlR6WmJRVUtaNW15b0pLMFh1?=
 =?utf-8?Q?01achliw6FySoxUQ=3D?=
X-Exchange-RoutingPolicyChecked: Z7qQGMk0OPnvlJW4b0l2z136NV1WD06ng4hgvH7hEnZoX2OjET3EoFgc6SFJmlCMSkSxgShTJYEZwCZXJ7muxkuEHIFPQN9WAFIoOJ7X/QX8vS7aUVAmoeuJM1NACGzHjkDUgHmcnF5w1mkWFw4R9Id+CUg/jlyJN40wnGMxCTn2OytYnXHQlmsBCsm5jg4UIktbxB6TkACqYs23vTzw2gloisElN6kqmzuekPN+ip4cg515ch9PgXElndRgCXrcda9EVdP6/wFxD+BGk8O6StGVPrl7lKbWMkBNXJVzlHn9vZaIkOGh14b2P71jNZvwIYuO3r5C7AiiIN4Lv+rNIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5e321f-f17f-4d11-a860-08deb6c91ceb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 23:40:02.5296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zv8Sdzp5/hYBUPGH02dFBTDNzWq1j92TImZ7JvRYnxFpSYMfTym3yfhJqwzgqLXDwlqGTgrHe3YgYciJzwbNcDG5dyruJ9zo+2CeYmNIZwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7670
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

I had previously commented in the review that there were no issues, but 
since issues were reported when I reviewed it using Claude code, I am 
leaving this comment.

The drm_gpusvm reference count leak issue mentioned in the comment below 
was reported by Thomas before.

commit 769fe4aed6bcbdc871dd1f4dce21327f510b4b24
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Fine grained page fault locking

Switches page fault handling to take vm->lock as read, adds a per-VMA
fault_lock and per-SVM-range mutex, and makes xe_svm_range_find_or_insert
take a reference on the returned range.

 > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
 > --- a/drivers/gpu/drm/xe/xe_svm.c
 > +++ b/drivers/gpu/drm/xe/xe_svm.c

[ ... ]

 > @@ -1483,11 +1516,15 @@ struct xe_svm_range 
*xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 >  {
 >  	struct drm_gpusvm_range *r;
 >
 > +	guard(mutex)(&vm->svm.range_lock);
 > +
 >  	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, 
xe_vma_start(vma)),
 >  					    xe_vma_start(vma), xe_vma_end(vma), ctx);
 >  	if (IS_ERR(r))
 >  		return ERR_CAST(r);
 >
 > +	drm_gpusvm_range_get(r);
 > +
 >  	return to_xe_range(r);
 >  }

xe_svm_range_find_or_insert now returns the range with an extra
drm_gpusvm reference that the caller must release.

In vm_bind_ioctl_ops_create() in xe_vm.c the PREFETCH path looks like:

	svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
	...
	if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
		xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
		goto check_next_range;
	}

	err = xa_alloc(&op->prefetch_range.range,
		       &i, svm_range, xa_limit_32b,
		       GFP_KERNEL);

	if (err)
		goto unwind_prefetch_ops;

	op->prefetch_range.ranges_count++;
	vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;

The cleanup path xe_vma_svm_prefetch_ranges_fini() only walks the
xarray:

	xa_for_each(&op->prefetch_range.range, i, svm_range)
		xe_svm_range_put(svm_range);

When xe_svm_range_validate() returns true the range is skipped via
goto check_next_range and never added to op->prefetch_range.range, so
the reference taken by xe_svm_range_find_or_insert() is not released.

The xa_alloc() failure path also goto's unwind_prefetch_ops before the
svm_range is in the xarray, and unwind_prefetch_ops ->
xe_svm_prefetch_gpuva_ops_fini() -> xe_vma_svm_prefetch_op_fini() also
only walks the xarray.

Additionally xe_vma_svm_prefetch_ops_fini() is gated by
XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH, which is only set after a successful
xa_alloc, so if every range hits the "RANGE IS VALID" path the cleanup
is skipped entirely for the vops.

Does this leak the drm_gpusvm range reference for prefetch ranges that
are already valid, or when xa_alloc fails on the first range?

 > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c 
b/drivers/gpu/drm/xe/xe_pagefault.c
 > --- a/drivers/gpu/drm/xe/xe_pagefault.c
 > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
 > @@ -184,10 +186,7 @@ static int xe_pagefault_service(struct 
xe_pagefault *pf)
 >  	if (IS_ERR(vm))
 >  		return PTR_ERR(vm);
 >
 > -	/*
 > -	 * TODO: Change to read lock? Using write lock for simplicity.
 > -	 */
 > -	down_write(&vm->lock);
 > +	down_read(&vm->lock);
 >
 >  	if (xe_vm_is_closed(vm)) {
 >  		err = -ENOENT;
 > @@ -217,7 +216,7 @@ static int xe_pagefault_service(struct 
xe_pagefault *pf)
 >  unlock_vm:
 >  	if (!err)
 >  		vm->usm.last_fault_vma = vma;
 > -	up_write(&vm->lock);
 > +	up_read(&vm->lock);
 >  	xe_vm_put(vm);

With vm->lock now held for read, multiple page fault handlers can hit
this assignment in parallel:

	vm->usm.last_fault_vma = vma;

xe_vm_find_vma_by_addr() reads the field twice without a local copy:

	if (vm->usm.last_fault_vma) {   /* Fast lookup */
		if (vma_matches(vm->usm.last_fault_vma, page_addr))
			vma = vm->usm.last_fault_vma;
	}

Is the plain shared access on last_fault_vma intentional, or should the
producer and consumer use WRITE_ONCE/READ_ONCE to avoid torn or
duplicated loads (KCSAN would also flag this as a data race)?

Assisted-by: Claude:claude-opus-4-7


On 5/18/26 4:08 PM, Gwan-gyeong Mun wrote:
> 
> 
> On 2/25/26 8:28 PM, Matthew Brost wrote:
>> Enable page faults to be serviced while holding vm->lock in read mode.
>>
>> Introduce additional locks to:
>>   - Ensure only one page fault thread services a given range or VMA
>>   - Serialize SVM garbage collection
>>   - Protect SVM range insertion and removal
>>
>> While these locks may contend during page faults, expensive operations
>> like migration can now run in parallel within a single VM.
>>
>> In addition to new locking, ranges must be reference-counted after
>> lookup, as another thread could immediately remove them from the GPU SVM
>> tree, potentially dropping the last reference.
>>
>> Lastly, decouple the VM’s ASID from the page fault queue selection to
>> allow parallel page fault handling within the same VM.
>>
>> Lays the groundwork for prefetch IOCTLs to use threaded migration too.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpusvm.c         |   2 +-
>>   drivers/gpu/drm/xe/xe_device_types.h |   2 +
>>   drivers/gpu/drm/xe/xe_pagefault.c    | 100 +++++++++++++++------------
>>   drivers/gpu/drm/xe/xe_svm.c          |  92 +++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_svm.h          |  44 ++++++++++++
>>   drivers/gpu/drm/xe/xe_userptr.c      |  20 +++++-
>>   drivers/gpu/drm/xe/xe_vm.c           |  40 +++++++++--
>>   drivers/gpu/drm/xe/xe_vm_types.h     |  24 ++++++-
>>   8 files changed, 243 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
>> index 35dd07297dd0..c71dba009d32 100644
>> --- a/drivers/gpu/drm/drm_gpusvm.c
>> +++ b/drivers/gpu/drm/drm_gpusvm.c
>> @@ -1624,7 +1624,7 @@ void drm_gpusvm_unmap_pages(struct drm_gpusvm 
>> *gpusvm,
>>                   const struct drm_gpusvm_ctx *ctx)
>>   {
>>       if (ctx->in_notifier)
>> -        lockdep_assert_held_write(&gpusvm->notifier_lock);
>> +        lockdep_assert_held(&gpusvm->notifier_lock);
>>       else
>>           drm_gpusvm_notifier_lock(gpusvm);
>>
> unrelated to the overall logic of this patch, but I have a question 
> regarding;
> In scenarios where the `drm_gpusvm_unmap_pages()` function is called, 
> are there any cases where `ctx->in_notifier` is false?
> If `ctx->in_notifier` is always true, would it be possible to remove the 
> `in_notifier` field from `struct drm_gpusvm_ctx`?
> 
> Is there a reason why the code doesn't explicitly require the use of the 
> `drm_gpusvm_notifier_lock()` and `drm_gpusvm_notifier_unlock()` pair in 
> the places where `drm_gpusvm_unmap_pages()` is called?
> 
> Apart from the questions above, the changes in this patch look good to me.
> 
> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index 8f3ef836541e..1eb0fe118940 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -304,6 +304,8 @@ struct xe_device {
>>           struct xarray asid_to_vm;
>>           /** @usm.next_asid: next ASID, used to cyclical alloc asids */
>>           u32 next_asid;
>> +        /** @usm.current_pf_queue: current page fault queue */
>> +        u32 current_pf_queue;
>>           /** @usm.lock: protects UM state */
>>           struct rw_semaphore lock;
>>           /** @usm.pf_wq: page fault work queue, unbound, high 
>> priority */
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/ 
>> xe_pagefault.c
>> index ea4857acf28d..421262c2a63a 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -71,9 +71,9 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, 
>> struct xe_vma *vma,
>>       struct xe_validation_ctx ctx;
>>       struct drm_exec exec;
>>       struct dma_fence *fence;
>> -    int err, needs_vram;
>> +    int err = 0, needs_vram;
>> -    lockdep_assert_held_write(&vm->lock);
>> +    lockdep_assert_held(&vm->lock);
>>       needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>>       if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
>> @@ -85,50 +85,52 @@ static int xe_pagefault_handle_vma(struct xe_gt 
>> *gt, struct xe_vma *vma,
>>       trace_xe_vma_pagefault(vma);
>> +    guard(mutex)(&vma->fault_lock);
>> +
>>       /* Check if VMA is valid, opportunistic check only */
>>       if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
>>                       vma->tile_invalidated) && !atomic)
>>           return 0;
>> -retry_userptr:
>> -    if (xe_vma_is_userptr(vma) &&
>> -        xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>> -        struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>> +    do {
>> +        if (xe_vma_is_userptr(vma) &&
>> +            xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>> +            struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>> -        err = xe_vma_userptr_pin_pages(uvma);
>> -        if (err)
>> -            return err;
>> -    }
>> +            err = xe_vma_userptr_pin_pages(uvma);
>> +            if (err)
>> +                return err;
>> +        }
>> -    /* Lock VM and BOs dma-resv */
>> -    xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct 
>> xe_val_flags) {});
>> -    drm_exec_until_all_locked(&exec) {
>> -        err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
>> -                     needs_vram == 1);
>> -        drm_exec_retry_on_contention(&exec);
>> -        xe_validation_retry_on_oom(&ctx, &err);
>> -        if (err)
>> -            goto unlock_dma_resv;
>> -
>> -        /* Bind VMA only to the GT that has faulted */
>> -        trace_xe_vma_pf_bind(vma);
>> -        xe_vm_set_validation_exec(vm, &exec);
>> -        fence = xe_vma_rebind(vm, vma, BIT(tile->id));
>> -        xe_vm_set_validation_exec(vm, NULL);
>> -        if (IS_ERR(fence)) {
>> -            err = PTR_ERR(fence);
>> +        /* Lock VM and BOs dma-resv */
>> +        xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
>> +                       (struct xe_val_flags) {});
>> +        drm_exec_until_all_locked(&exec) {
>> +            err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
>> +                         needs_vram == 1);
>> +            drm_exec_retry_on_contention(&exec);
>>               xe_validation_retry_on_oom(&ctx, &err);
>> -            goto unlock_dma_resv;
>> +            if (err)
>> +                break;
>> +
>> +            /* Bind VMA only to the GT that has faulted */
>> +            trace_xe_vma_pf_bind(vma);
>> +            xe_vm_set_validation_exec(vm, &exec);
>> +            fence = xe_vma_rebind(vm, vma, BIT(tile->id));
>> +            xe_vm_set_validation_exec(vm, NULL);
>> +            if (IS_ERR(fence)) {
>> +                err = PTR_ERR(fence);
>> +                xe_validation_retry_on_oom(&ctx, &err);
>> +                break;
>> +            }
>>           }
>> -    }
>> +        xe_validation_ctx_fini(&ctx);
>> +    } while (err == -EAGAIN);
>> -    dma_fence_wait(fence, false);
>> -    dma_fence_put(fence);
>> -
>> -unlock_dma_resv:
>> -    xe_validation_ctx_fini(&ctx);
>> -    if (err == -EAGAIN)
>> -        goto retry_userptr;
>> +    if (!err) {
>> +        dma_fence_wait(fence, false);
>> +        dma_fence_put(fence);
>> +    }
>>       return err;
>>   }
>> @@ -171,10 +173,7 @@ static int xe_pagefault_service(struct 
>> xe_pagefault *pf)
>>       if (IS_ERR(vm))
>>           return PTR_ERR(vm);
>> -    /*
>> -     * TODO: Change to read lock? Using write lock for simplicity.
>> -     */
>> -    down_write(&vm->lock);
>> +    down_read(&vm->lock);
>>       if (xe_vm_is_closed(vm)) {
>>           err = -ENOENT;
>> @@ -198,7 +197,7 @@ static int xe_pagefault_service(struct 
>> xe_pagefault *pf)
>>   unlock_vm:
>>       if (!err)
>>           vm->usm.last_fault_vma = vma;
>> -    up_write(&vm->lock);
>> +    up_read(&vm->lock);
>>       xe_vm_put(vm);
>>       return err;
>> @@ -418,6 +417,19 @@ static bool xe_pagefault_queue_full(struct 
>> xe_pagefault_queue *pf_queue)
>>           xe_pagefault_entry_size();
>>   }
>> +/*
>> + * This function can race with multiple page fault producers, but 
>> worst case we
>> + * stick a page fault on the same queue for consumption.
>> + */
>> +static int xe_pagefault_queue_index(struct xe_device *xe)
>> +{
>> +    u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
>> +
>> +    WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
>> +
>> +    return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
>> +}
>> +
>>   /**
>>    * xe_pagefault_handler() - Page fault handler
>>    * @xe: xe device instance
>> @@ -430,8 +442,8 @@ static bool xe_pagefault_queue_full(struct 
>> xe_pagefault_queue *pf_queue)
>>    */
>>   int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>>   {
>> -    struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
>> -        (pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
>> +    int queue_index = xe_pagefault_queue_index(xe);
>> +    struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + 
>> queue_index;
>>       unsigned long flags;
>>       bool full;
>> @@ -445,7 +457,7 @@ int xe_pagefault_handler(struct xe_device *xe, 
>> struct xe_pagefault *pf)
>>       } else {
>>           drm_warn(&xe->drm,
>>                "PageFault Queue (%d) full, shouldn't be possible\n",
>> -             pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
>> +             queue_index);
>>       }
>>       spin_unlock_irqrestore(&pf_queue->lock, flags);
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 002b6c22ad3f..3e59695e0c01 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -114,6 +114,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>>           return NULL;
>>       INIT_LIST_HEAD(&range->garbage_collector_link);
>> +    mutex_init(&range->lock);
>>       xe_vm_get(gpusvm_to_vm(gpusvm));
>>       return &range->base;
>> @@ -121,6 +122,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>>   static void xe_svm_range_free(struct drm_gpusvm_range *range)
>>   {
>> +    mutex_destroy(&to_xe_range(range)->lock);
>>       xe_vm_put(range_to_vm(range));
>>       kfree(range);
>>   }
>> @@ -135,11 +137,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm 
>> *vm, struct xe_svm_range *range,
>>       drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
>> -    spin_lock(&vm->svm.garbage_collector.lock);
>> +    spin_lock(&vm->svm.garbage_collector.list_lock);
>>       if (list_empty(&range->garbage_collector_link))
>>           list_add_tail(&range->garbage_collector_link,
>>                     &vm->svm.garbage_collector.range_list);
>> -    spin_unlock(&vm->svm.garbage_collector.lock);
>> +    spin_unlock(&vm->svm.garbage_collector.list_lock);
>>       queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
>>   }
>> @@ -297,16 +299,24 @@ static int __xe_svm_garbage_collector(struct 
>> xe_vm *vm,
>>   {
>>       struct dma_fence *fence;
>> -    range_debug(range, "GARBAGE COLLECTOR");
>> +    scoped_guard(mutex, &range->lock) {
>> +        drm_gpusvm_range_get(&range->base);
>> +        range->removed = true;
>> -    xe_vm_lock(vm, false);
>> -    fence = xe_vm_range_unbind(vm, range);
>> -    xe_vm_unlock(vm);
>> -    if (IS_ERR(fence))
>> -        return PTR_ERR(fence);
>> -    dma_fence_put(fence);
>> +        range_debug(range, "GARBAGE COLLECTOR");
>> +
>> +        xe_vm_lock(vm, false);
>> +        fence = xe_vm_range_unbind(vm, range);
>> +        xe_vm_unlock(vm);
>> +        if (IS_ERR(fence))
>> +            return PTR_ERR(fence);
>> +        dma_fence_put(fence);
>> -    drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
>> +        scoped_guard(mutex, &vm->svm.range_lock)
>> +            drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
>> +    }
>> +
>> +    drm_gpusvm_range_put(&range->base);
>>       return 0;
>>   }
>> @@ -378,13 +388,15 @@ static int xe_svm_garbage_collector(struct xe_vm 
>> *vm)
>>       u64 range_end;
>>       int err, ret = 0;
>> -    lockdep_assert_held_write(&vm->lock);
>> +    lockdep_assert_held(&vm->lock);
>>       if (xe_vm_is_closed_or_banned(vm))
>>           return -ENOENT;
>> +    guard(mutex)(&vm->svm.garbage_collector.lock);
>> +
>>       for (;;) {
>> -        spin_lock(&vm->svm.garbage_collector.lock);
>> +        spin_lock(&vm->svm.garbage_collector.list_lock);
>>           range = list_first_entry_or_null(&vm- 
>> >svm.garbage_collector.range_list,
>>                            typeof(*range),
>>                            garbage_collector_link);
>> @@ -395,7 +407,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>           range_end = xe_svm_range_end(range);
>>           list_del(&range->garbage_collector_link);
>> -        spin_unlock(&vm->svm.garbage_collector.lock);
>> +        spin_unlock(&vm->svm.garbage_collector.list_lock);
>>           err = __xe_svm_garbage_collector(vm, range);
>>           if (err) {
>> @@ -414,7 +426,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>>                   return err;
>>           }
>>       }
>> -    spin_unlock(&vm->svm.garbage_collector.lock);
>> +    spin_unlock(&vm->svm.garbage_collector.list_lock);
>>       return ret;
>>   }
>> @@ -424,9 +436,8 @@ static void 
>> xe_svm_garbage_collector_work_func(struct work_struct *w)
>>       struct xe_vm *vm = container_of(w, struct xe_vm,
>>                       svm.garbage_collector.work);
>> -    down_write(&vm->lock);
>> +    guard(rwsem_read)(&vm->lock);
>>       xe_svm_garbage_collector(vm);
>> -    up_write(&vm->lock);
>>   }
>>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>> @@ -855,8 +866,11 @@ int xe_svm_init(struct xe_vm *vm)
>>   {
>>       int err;
>> +    mutex_init(&vm->svm.range_lock);
>> +    mutex_init(&vm->svm.garbage_collector.lock);
>> +
>>       if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
>> -        spin_lock_init(&vm->svm.garbage_collector.lock);
>> +        spin_lock_init(&vm->svm.garbage_collector.list_lock);
>>           INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
>>           INIT_WORK(&vm->svm.garbage_collector.work,
>>                 xe_svm_garbage_collector_work_func);
>> @@ -878,7 +892,7 @@ int xe_svm_init(struct xe_vm *vm)
>>                         xe_modparam.svm_notifier_size * SZ_1M,
>>                         &gpusvm_ops, fault_chunk_sizes,
>>                         ARRAY_SIZE(fault_chunk_sizes));
>> -        drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
>> +        drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm- 
>> >svm.range_lock);
>>           if (err) {
>>               xe_svm_put_pagemaps(vm);
>> @@ -918,7 +932,10 @@ void xe_svm_fini(struct xe_vm *vm)
>>   {
>>       xe_assert(vm->xe, xe_vm_is_closed(vm));
>> -    drm_gpusvm_fini(&vm->svm.gpusvm);
>> +    scoped_guard(mutex, &vm->svm.range_lock)
>> +        drm_gpusvm_fini(&vm->svm.gpusvm);
>> +    mutex_destroy(&vm->svm.range_lock);
>> +    mutex_destroy(&vm->svm.garbage_collector.lock);
>>   }
>>   static bool xe_svm_range_has_pagemap_locked(const struct 
>> xe_svm_range *range,
>> @@ -1198,20 +1215,26 @@ static int __xe_svm_handle_pagefault(struct 
>> xe_vm *vm, struct xe_vma *vma,
>>       };
>>       struct xe_validation_ctx vctx;
>>       struct drm_exec exec;
>> -    struct xe_svm_range *range;
>> +    struct xe_svm_range *range = NULL;
>>       struct dma_fence *fence;
>>       struct drm_pagemap *dpagemap;
>>       struct xe_tile *tile = gt_to_tile(gt);
>>       int migrate_try_count = ctx.devmem_only ? 3 : 1;
>>       ktime_t start = xe_gt_stats_ktime_get(), bind_start, 
>> get_pages_start;
>> -    int err;
>> +    int err = 0;
>> -    lockdep_assert_held_write(&vm->lock);
>> +    lockdep_assert_held(&vm->lock);
>>       xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>>       xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>>   retry:
>> +    /* Release old range */
>> +    if (range) {
>> +        mutex_unlock(&range->lock);
>> +        drm_gpusvm_range_put(&range->base);
>> +    }
>> +
>>       /* Always process UNMAPs first so view SVM ranges is current */
>>       err = xe_svm_garbage_collector(vm);
>>       if (err)
>> @@ -1227,6 +1250,11 @@ static int __xe_svm_handle_pagefault(struct 
>> xe_vm *vm, struct xe_vma *vma,
>>       xe_svm_range_fault_count_stats_incr(gt, range);
>> +    mutex_lock(&range->lock);
>> +
>> +    if (xe_svm_range_is_removed(range))
>> +        goto retry;
>> +
>>       if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
>>           err = -EACCES;
>>           goto out;
>> @@ -1268,7 +1296,7 @@ static int __xe_svm_handle_pagefault(struct 
>> xe_vm *vm, struct xe_vma *vma,
>>                   drm_err(&vm->xe->drm,
>>                       "VRAM allocation failed, retry count exceeded, 
>> asid=%u, errno=%pe\n",
>>                       vm->usm.asid, ERR_PTR(err));
>> -                return err;
>> +                goto err_out;
>>               }
>>           }
>>       }
>> @@ -1330,6 +1358,8 @@ static int __xe_svm_handle_pagefault(struct 
>> xe_vm *vm, struct xe_vma *vma,
>>   out:
>>       xe_svm_range_fault_us_stats_incr(gt, range, start);
>> +    mutex_unlock(&range->lock);
>> +    drm_gpusvm_range_put(&range->base);
>>       return 0;
>>   err_out:
>> @@ -1339,6 +1369,9 @@ static int __xe_svm_handle_pagefault(struct 
>> xe_vm *vm, struct xe_vma *vma,
>>           goto retry;
>>       }
>> +    mutex_unlock(&range->lock);
>> +    drm_gpusvm_range_put(&range->base);
>> +
>>       return err;
>>   }
>> @@ -1421,9 +1454,9 @@ void xe_svm_unmap_address_range(struct xe_vm 
>> *vm, u64 start, u64 end)
>>                   drm_gpusvm_range_get(range);
>>                   __xe_svm_garbage_collector(vm, to_xe_range(range));
>>                   if (!list_empty(&to_xe_range(range)- 
>> >garbage_collector_link)) {
>> -                    spin_lock(&vm->svm.garbage_collector.lock);
>> +                    spin_lock(&vm->svm.garbage_collector.list_lock);
>>                       list_del(&to_xe_range(range)- 
>> >garbage_collector_link);
>> -                    spin_unlock(&vm->svm.garbage_collector.lock);
>> +                    spin_unlock(&vm->svm.garbage_collector.list_lock);
>>                   }
>>                   drm_gpusvm_range_put(range);
>>               }
>> @@ -1453,7 +1486,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>>    * @ctx: GPU SVM context
>>    *
>>    * This function finds or inserts a newly allocated a SVM range 
>> based on the
>> - * address.
>> + * address. Take a reference to SVM range on success.
>>    *
>>    * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
>>    */
>> @@ -1462,11 +1495,15 @@ struct xe_svm_range 
>> *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>>   {
>>       struct drm_gpusvm_range *r;
>> +    guard(mutex)(&vm->svm.range_lock);
>> +
>>       r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, 
>> xe_vma_start(vma)),
>>                           xe_vma_start(vma), xe_vma_end(vma), ctx);
>>       if (IS_ERR(r))
>>           return ERR_CAST(r);
>> +    drm_gpusvm_range_get(r);
>> +
>>       return to_xe_range(r);
>>   }
>> @@ -1486,6 +1523,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, 
>> struct xe_svm_range *range,
>>   {
>>       int err = 0;
>> +    lockdep_assert_held(&range->lock);
>> +
>>       err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, 
>> ctx);
>>       if (err == -EOPNOTSUPP) {
>>           range_debug(range, "PAGE FAULT - EVICT PAGES");
>> @@ -1602,6 +1641,7 @@ int xe_svm_alloc_vram(struct xe_svm_range 
>> *range, const struct drm_gpusvm_ctx *c
>>       int err, retries = 1;
>>       bool write_locked = false;
>> +    lockdep_assert_held(&range->lock);
>>       xe_assert(range_to_vm(&range->base)->xe, range- 
>> >base.pages.flags.migrate_devmem);
>>       range_debug(range, "ALLOCATE VRAM");
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index b7b8eeacf196..fd26bfeb4a07 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -36,6 +36,13 @@ struct xe_svm_range {
>>        * list. Protected by VM's garbage collect lock.
>>        */
>>       struct list_head garbage_collector_link;
>> +    /**
>> +     * @lock: Protects fault handler, garbage collector, and prefetch
>> +     * critical sections, ensuring only one thread operates on a 
>> range at a
>> +     * time. Locking order: inside vm->lock and garbage collector, 
>> outside
>> +     * dma-resv locks, vm->svm.range_lock.
>> +     */
>> +    struct mutex lock;
>>       /**
>>        * @tile_present: Tile mask of binding is present for this range.
>>        * Protected by GPU SVM notifier lock.
>> @@ -46,8 +53,22 @@ struct xe_svm_range {
>>        * range. Protected by GPU SVM notifier lock.
>>        */
>>       u8 tile_invalidated;
>> +    /**
>> +     * @removed: Range has been removed from GPU SVM tree, protected by
>> +     * @lock.
>> +     */
>> +    bool removed;
>>   };
>> +/**
>> + * xe_svm_range_put() - SVM range put
>> + * @range: SVM range
>> + */
>> +static inline void xe_svm_range_put(struct xe_svm_range *range)
>> +{
>> +    drm_gpusvm_range_put(&range->base);
>> +}
>> +
>>   /**
>>    * struct xe_pagemap - Manages xe device_private memory for SVM.
>>    * @pagemap: The struct dev_pagemap providing the struct pages.
>> @@ -135,6 +156,19 @@ static inline bool 
>> xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>>       return range->base.pages.flags.has_dma_mapping;
>>   }
>> +/**
>> + * xe_svm_range_is_removed() - SVM range is removed from GPU SVM tree
>> + * @range: SVM range
>> + *
>> + * Return: True if SVM range is removed from GPU SVM tree, False 
>> otherwise
>> + */
>> +static inline bool xe_svm_range_is_removed(struct xe_svm_range *range)
>> +{
>> +    lockdep_assert_held(&range->lock);
>> +
>> +    return range->removed;
>> +}
>> +
>>   /**
>>    * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
>>    * @r: Pointer to the drm_gpusvm_range structure
>> @@ -214,10 +248,15 @@ struct xe_svm_range {
>>               const struct drm_pagemap_addr *dma_addr;
>>           } pages;
>>       } base;
>> +    struct mutex lock;
>>       u32 tile_present;
>>       u32 tile_invalidated;
>>   };
>> +static inline void xe_svm_range_put(struct xe_svm_range *range)
>> +{
>> +}
>> +
>>   static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>>   {
>>       return false;
>> @@ -387,6 +426,11 @@ static inline struct drm_pagemap 
>> *xe_drm_pagemap_from_fd(int fd, u32 region_inst
>>       return ERR_PTR(-ENOENT);
>>   }
>> +static inline bool xe_svm_range_is_removed(struct xe_svm_range *range)
>> +{
>> +    return false;
>> +}
>> +
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   #endif /* CONFIG_DRM_XE_GPUSVM */
>> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/ 
>> xe_userptr.c
>> index e120323c43bc..bf6043de1b8e 100644
>> --- a/drivers/gpu/drm/xe/xe_userptr.c
>> +++ b/drivers/gpu/drm/xe/xe_userptr.c
>> @@ -48,6 +48,22 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>>           list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>>   }
>> +#if IS_ENABLED(CONFIG_PROVE_LOCKING)
>> +static bool __xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
>> +{
>> +    struct xe_vma *vma = &uvma->vma;
>> +    struct xe_vm *vm = xe_vma_vm(vma);
>> +
>> +    return lockdep_is_held_type(&vm->lock, 0) ||
>> +        (lockdep_is_held_type(&vm->lock, 1) &&
>> +         lockdep_is_held_type(&vma->fault_lock, 0));
>> +}
>> +#define xe_vma_userptr_lockdep(uvma)    \
>> +    lockdep_assert(__xe_vma_userptr_lockdep(uvma))
>> +#else
>> +#define xe_vma_userptr_lockdep(uvma)
>> +#endif
>> +
>>   int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>>   {
>>       struct xe_vma *vma = &uvma->vma;
>> @@ -59,7 +75,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma 
>> *uvma)
>>           .allow_mixed = true,
>>       };
>> -    lockdep_assert_held(&vm->lock);
>> +    xe_vma_userptr_lockdep(uvma);
>>       xe_assert(xe, xe_vma_is_userptr(vma));
>>       if (vma->gpuva.flags & XE_VMA_DESTROYED)
>> @@ -167,7 +183,7 @@ void xe_vma_userptr_force_invalidate(struct 
>> xe_userptr_vma *uvma)
>>       struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>>       /* Protect against concurrent userptr pinning */
>> -    lockdep_assert_held(&vm->lock);
>> +    xe_vma_userptr_lockdep(uvma);
>>       /* Protect against concurrent notifiers */
>>       lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
>>       /*
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 548b0769b3ef..3332a86f464f 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -597,6 +597,17 @@ static int xe_vma_ops_alloc(struct xe_vma_ops 
>> *vops, bool array_of_binds)
>>   }
>>   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>> +static void xe_vma_svm_prefetch_ranges_fini(struct xe_vma_op *op)
>> +{
>> +    struct xe_svm_range *svm_range;
>> +    unsigned long i;
>> +
>> +    xa_for_each(&op->prefetch_range.range, i, svm_range)
>> +        xe_svm_range_put(svm_range);
>> +
>> +    xa_destroy(&op->prefetch_range.range);
>> +}
>> +
>>   static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
>>   {
>>       struct xe_vma *vma;
>> @@ -604,7 +615,7 @@ static void xe_vma_svm_prefetch_op_fini(struct 
>> xe_vma_op *op)
>>       vma = gpuva_to_vma(op->base.prefetch.va);
>>       if (op->base.op == DRM_GPUVA_OP_PREFETCH && 
>> xe_vma_is_cpu_addr_mirror(vma))
>> -        xa_destroy(&op->prefetch_range.range);
>> +        xe_vma_svm_prefetch_ranges_fini(op);
>>   }
>>   static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
>> @@ -838,6 +849,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm 
>> *vm,
>>       u8 id;
>>       int err;
>> +    lockdep_assert_held(&range->lock);
>>       lockdep_assert_held(&vm->lock);
>>       xe_vm_assert_held(vm);
>>       xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
>> @@ -920,6 +932,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm 
>> *vm,
>>       u8 id;
>>       int err;
>> +    lockdep_assert_held(&range->lock);
>>       lockdep_assert_held(&vm->lock);
>>       xe_vm_assert_held(vm);
>>       xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
>> @@ -1023,6 +1036,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm 
>> *vm,
>>               vma->gpuva.gem.obj = &bo->ttm.base;
>>       }
>> +    mutex_init(&vma->fault_lock);
>> +
>>       INIT_LIST_HEAD(&vma->combined_links.rebind);
>>       INIT_LIST_HEAD(&vma->gpuva.gem.entry);
>> @@ -1095,6 +1110,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>           xe_bo_put(xe_vma_bo(vma));
>>       }
>> +    mutex_destroy(&vma->fault_lock);
>>       xe_vma_free(vma);
>>   }
>> @@ -1115,11 +1131,18 @@ static void vma_destroy_cb(struct dma_fence 
>> *fence,
>>       queue_work(system_dfl_wq, &vma->destroy_work);
>>   }
>> +static void xe_vm_assert_write_mode_or_garbage_collector(struct xe_vm 
>> *vm)
>> +{
>> +    lockdep_assert(lockdep_is_held_type(&vm->lock, 0) ||
>> +               (lockdep_is_held_type(&vm->lock, 1) &&
>> +            lockdep_is_held_type(&vm->svm.garbage_collector.lock, 0)));
>> +}
>> +
>>   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   {
>>       struct xe_vm *vm = xe_vma_vm(vma);
>> -    lockdep_assert_held_write(&vm->lock);
>> +    xe_vm_assert_write_mode_or_garbage_collector(vm);
>>       xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
>>       if (xe_vma_is_userptr(vma)) {
>> @@ -2462,7 +2485,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, 
>> struct drm_gpuva_op_map *op,
>>       struct xe_vma *vma;
>>       int err = 0;
>> -    lockdep_assert_held_write(&vm->lock);
>> +    xe_vm_assert_write_mode_or_garbage_collector(vm);
>>       if (bo) {
>>           err = 0;
>> @@ -2559,7 +2582,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, 
>> struct xe_vma_op *op)
>>   {
>>       int err = 0;
>> -    lockdep_assert_held_write(&vm->lock);
>> +    xe_vm_assert_write_mode_or_garbage_collector(vm);
>>       switch (op->base.op) {
>>       case DRM_GPUVA_OP_MAP:
>> @@ -2650,7 +2673,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm 
>> *vm, struct drm_gpuva_ops *ops,
>>       u8 id, tile_mask = 0;
>>       int err = 0;
>> -    lockdep_assert_held_write(&vm->lock);
>> +    xe_vm_assert_write_mode_or_garbage_collector(vm);
>>       for_each_tile(tile, vm->xe, id)
>>           tile_mask |= 0x1 << id;
>> @@ -2826,7 +2849,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, 
>> struct xe_vma_op *op,
>>                    bool post_commit, bool prev_post_commit,
>>                    bool next_post_commit)
>>   {
>> -    lockdep_assert_held_write(&vm->lock);
>> +    xe_vm_assert_write_mode_or_garbage_collector(vm);
>>       switch (op->base.op) {
>>       case DRM_GPUVA_OP_MAP:
>> @@ -2956,6 +2979,11 @@ static int prefetch_ranges(struct xe_vm *vm, 
>> struct xe_vma_op *op)
>>       /* TODO: Threading the migration */
>>       xa_for_each(&op->prefetch_range.range, i, svm_range) {
>> +        guard(mutex)(&svm_range->lock);
>> +
>> +        if (xe_svm_range_is_removed(svm_range))
>> +            return -ENODATA;
>> +
>>           if (!dpagemap)
>>               xe_svm_range_migrate_to_smem(vm, svm_range);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/ 
>> xe_vm_types.h
>> index 1f6f7e30e751..9c91934ec47f 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -119,6 +119,12 @@ struct xe_vma {
>>           struct work_struct destroy_work;
>>       };
>> +    /**
>> +     * @fault_lock: Synchronizes fault processing. Locking order: inside
>> +     * vm->lock, outside dma-resv.
>> +     */
>> +    struct mutex fault_lock;
>> +
>>       /**
>>        * @tile_invalidated: Tile mask of binding are invalidated for 
>> this VMA.
>>        * protected by BO's resv and for userptrs, vm- 
>> >svm.gpusvm.notifier_lock in
>> @@ -183,13 +189,27 @@ struct xe_vm {
>>       struct {
>>           /** @svm.gpusvm: base GPUSVM used to track fault allocations */
>>           struct drm_gpusvm gpusvm;
>> +        /**
>> +         * @svm.range_lock: Protects insertion and removal of ranges
>> +         * from GPU SVM tree.
>> +         */
>> +        struct mutex range_lock;
>>           /**
>>            * @svm.garbage_collector: Garbage collector which is used 
>> unmap
>>            * SVM range's GPU bindings and destroy the ranges.
>>            */
>>           struct {
>> -            /** @svm.garbage_collector.lock: Protect's range list */
>> -            spinlock_t lock;
>> +            /**
>> +             * @svm.garbage_collector.lock: Ensures only one thread
>> +             * runs the garbage collector at a time. Locking order:
>> +             * inside vm->lock, outside range->lock and dma-resv.
>> +             */
>> +            struct mutex lock;
>> +            /**
>> +             * @svm.garbage_collector.list_lock: Protect's range
>> +             * list
>> +             */
>> +            spinlock_t list_lock;
>>               /**
>>                * @svm.garbage_collector.range_list: List of SVM ranges
>>                * in the garbage collector.
> 

