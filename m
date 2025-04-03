Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5AEC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 15:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66910EA3A;
	Thu,  3 Apr 2025 15:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8EiSY+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF16510EA3A
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743693647; x=1775229647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xz/pkHMDl1FeFMu9uzC1OZmSmy4nR03nwAgPHMXJqcA=;
 b=h8EiSY+AWDGUZELgGImEb/JRAdKhU9uQ4GHaD2TEitDeRf7j/pwbn9Th
 20BOMlNtYHVG+wetjJu81CUjU8/pbKv4LS0HT3o0FHfnZhGpcybLucXbA
 LA1iiwOyBpyNRLWEJwHqP8eZRqrrt3p5NvdOCdXx4Uq8MzsS5PsHTikfM
 BE9xA7mwBBJSrIYgxOiZCxHXSSkcMsgsygp3qAbotRUv45U/ZyiOgXsRl
 aLwP1Llo0iGQXGDi/HGmvJhd1/Wi6HWiU4H6fJAs0Euycz2Il4oaH6Ftz
 f5gvSw1vHd88fnL0mhL8CJapWBDUrBydGAsQc99MRdiXkYyTE35FyO9sG g==;
X-CSE-ConnectionGUID: 9O8RTehOQg++FMbpQTSc0A==
X-CSE-MsgGUID: AhiJ7sSbQZ2lgfbvJNVKvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55740059"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="55740059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:20:47 -0700
X-CSE-ConnectionGUID: MMfmk88gRiWq5FeZLKo9UA==
X-CSE-MsgGUID: oYHPyV9nSKCfGpzePSkRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131895584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 08:20:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 08:20:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 08:20:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 08:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJ3bkyb1U9QlEtTMzQPw8S7xFIP4IKU4PAoRaGIBoSLEQsT11UooTxg9oPgsv5h2jnf4D1pJLmQaxM3kfAp9g73yHRAXd7Wp9eJbjBXhqtgzHcjN2vMEjZe+UZdw/T/OQlfHV+AH8S48SjY3a/8gmtp7cNS6LT9frkYKweQRFUVRVR3doKURrJKHcV/MtFvCr8hsIhYHQci++NETYTm8ehqUKWEcj66KGaab3KTs0ypqcUZLapIAx5N7fibCbE/hHZ9lG69fQL37NyCcpFQuOy6p3tQQOh/qoKvVmc4Mrq59yXMrdUKAgkoeiuCT86txHaIB9EMvcienLRMyf3TYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoZPtmeOzBnqPDLuYwTXJYu9aT8Oeoc5CeVEdsLrW+o=;
 b=reCdFnaP1CgC339zNbR19zpzx9XJDNaTqNegJjxjQCRbZ6Cw0LzQ37r6JPVcC8BSUgFALJ1ucZ0FlTvfsl3Dm7WNmrwGpm6xbXChwTmxWTd0NJHVMI1xq7imarTXAU59kRa4x0tro+TuKUdGcOc5GrtOC+ysMpmOouXELIJcUyJ7hXZHL3RpV8IAc1Ud/nhREd9+QjHv3ZpOsOh32PuLUE54kpt8almUtJZjZ6MOLuwU59Fh3lxBQkGZUisBhgVMPB884ZQSpkTKjlpw7QUx5iO7Bv9Qyso+WJX6B/GIgtGcCV0vDvxRgMowxsm51JvA/1mnGNRySM6N7Edp72aYww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 15:20:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 15:20:14 +0000
Message-ID: <ce6d3489-ee79-4834-b4be-1c5a590d682d@intel.com>
Date: Thu, 3 Apr 2025 11:20:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Add LFD format output for guc log
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
 <20250327234028.249314-2-zhanjun.dong@intel.com>
 <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <Z+YaCmivtd1Wa9wU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|BL1PR11MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dccb96-8b02-4eeb-fdff-08dd72c30865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3F6bVk2NFpucGFxQUlmM25mOWNTVlRMbUc4NjdXQUdwWDB6cXA0VEpIeC9E?=
 =?utf-8?B?YzV5RFF1Mms0M2FjQ0U2ZUFuWkoydFMwTmhaemYvdmRNa2xnWm1pMkZSQ0VM?=
 =?utf-8?B?WllISWJIa2svdWFGaCtMQmZ0bnFWdml3MGpuT3M2WXhaSFEwcG1pVGtLQUpW?=
 =?utf-8?B?ZXhGR0U5bkRJMlh0WkZVK2pRODdYVmZ3NUxGS1MyY2Z4RWxuUzQ1cFd1YkJW?=
 =?utf-8?B?cXlrWUprekJNZmNUNTU0OGpYYjFPNW1acEdqenUwT3k5YnQ5N21CSktKNEJ1?=
 =?utf-8?B?NTVab2xSa3UvRFNkUUpFOFZFWmY4NHd3RVo2bkw1eHQzbkNNZXN2UVptUGxm?=
 =?utf-8?B?MDBVYVNKME1aRE1xWUt3alRYdDYraUowbDRCR09WOWlYRXdBczZ0TVFvNWJj?=
 =?utf-8?B?VlN0YzNWY2VyVUJFM0ErcFN3MjZHdXBVeEQ1STBHbEtxWnM0NG9wTmxWRDUv?=
 =?utf-8?B?ZXRsOHE5dWZQY3kyajFCVEJJc1U5b0xVUVZhQ2VpYWEyVnRVVDFSU2haUmpD?=
 =?utf-8?B?ZUVXU09FenRyNzdWU1RabHA4dWNDTExuT1NmWEpTaFMxbVpTbTlYdnlqWEJR?=
 =?utf-8?B?RWxqTHJWaW1QNS9WUms0ZXUreU0va0oxVThBYjFTdTYvUHArdGdsZDdTdFly?=
 =?utf-8?B?RytXb0pJb2w4enZVQjRXWkNUVUJlNlluOEI5R1pIVHprNVRPUC80NjhTd2hZ?=
 =?utf-8?B?TnRpQlgzdExkdEliZ2lrQTA5QmtVVVlYZEZ2MFZTbE5hVDl5Szlsa2wwOWh1?=
 =?utf-8?B?cHNjZ1lvRXUwdnlySFd2VHB4M2V3WkRjYXpHTkQrWkZYOCtUR2JsSkxYWm5N?=
 =?utf-8?B?cjZmU2RuZytiWGhPVFFQTVZXRUg4T3pWd3U2KzhLOVZHN3RtU3RINEljbmJI?=
 =?utf-8?B?bkVwWWVWM0I1THR2SDUyc1ludW43UzBDb2QxSlVMVmxTM1haNVc1QzBDM2lj?=
 =?utf-8?B?YVlwQXVtTC9JcWtXcnlpQjFaV21WR0EvWGVxSGxyQVF4SjZQRTFFQ2pKNm1k?=
 =?utf-8?B?aVhLTzhqZjlmaUs4NFhvbHE5cFUwTDNrdkR6dUNsbGRuaTEwUnMrNzMvcDN2?=
 =?utf-8?B?a1pPKzlFYmVkL05LZ1FENjhXUFFvbjBsSjIvUStzK2l2YS9ld0x2MWdTa1lN?=
 =?utf-8?B?TGoyazJReUNmeHB2YnVyTW5YbE52M3pqWURQeUtQblN5UHB5UStZSGsxYnlR?=
 =?utf-8?B?d0FQOFZUdXpRejRKUEo3ei9COEdScWI3c0daZzNqVEtkTkdEaDlqdlhkRWg4?=
 =?utf-8?B?enJvZGhXcnFRcEZrRzlzUG1VaFhnV1JBdndERGdiTFRCakYyN1QwLys3UUk1?=
 =?utf-8?B?YmllSUc5THpVTmJYc0VCaTFwZEV1TEg3MWpnSmUxOUdySG5IbTZPWUQzRHlz?=
 =?utf-8?B?bVllNTVPbHJMc3RNak1aQWxmRzFLd1hOYWRBenY1ZTRlYVN1ODNSNzlYSDAv?=
 =?utf-8?B?WGFubEhraUZUajEvWGo3R2dpTXNsMGZNUFM0SDNzSEdrWEc2cmhlaW5FSzRQ?=
 =?utf-8?B?NUtGNGlaK3BWdTQwQXJnVFBIT0lsYkhKZWM0d3VkYTdTckJ5VDFHRnpQTXFm?=
 =?utf-8?B?em9ueVZCc0RJWGJKdG5id0ZveVJ6OHFVRGNoMEEzM2x6c0pOUzdxS0hoeVdH?=
 =?utf-8?B?dFpuVU81a3drbURKU1dNUG53MkpPdVo1aktnZm8vVG42a1Q1K0J2aEdBY1cr?=
 =?utf-8?B?REd0RmdmUzdwZDBaT0c4ZG5TRW5RTW5IY1NwMlViYjdKUUhlTWRsd1Ztbmx1?=
 =?utf-8?B?YkFwMmd1NDkwcmlEbUNrT01pUzM5b0h2RVBiZi9TcFNwclcyVDVlcDl6TFh2?=
 =?utf-8?B?aVFSYnIwdUxKeWtKYWZKMng2bkU1ZHZycXhBZGNCRmFKMTYzSUZpMFF2L0pW?=
 =?utf-8?Q?CTnNdkEkuZjCo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdBdE9QR0tHSDNIZVZKeC9vUytaSHVYY2FlbFgxZGRxT3M2dER1L1hSWFZD?=
 =?utf-8?B?ZjFhR2JzeFlkNEpMVVJsMHNUT3FjYWFleFdrc3JoZUxoL3Z3QWp1TGtZT2Ju?=
 =?utf-8?B?cE5ZTmpZT0t2WXJSTU0vR29ldEdoOTRKRDhWR2ZBOTlLQzE2TjQyUms4U2VW?=
 =?utf-8?B?MUh6SDAwOEVUYm5hMWVrcEIveVFZcWdvdkdzLzlQWklwTTBjVWdRL2trb3lu?=
 =?utf-8?B?MkdhT2dzemVxQ1VBMVBBMjlKUTBDZ2FRanNEeURkbEY4NzMwU3pUZzZRWmZR?=
 =?utf-8?B?K3FzM0VtVXN1TklwMHR0YzdoYUZpVTVRMU52Wms0Sks0TUh6L21uT1pmUzhi?=
 =?utf-8?B?R3p4Szk1VFBiK3RoS3kzVTdTTi96eUttV1p2R2JJakQ3THIydllYTldQTmJs?=
 =?utf-8?B?NWN4NjZ3K2pXcSt6cjBDdUpxK0szU1lTUFl5UkxSTENGZkhKTnNvOUNWVFZo?=
 =?utf-8?B?bkRVMmo1RVVkM3dRZlljSy9kNFFNMUllZ0F2c3Z1RGVwZXVDblBRYXpDdUdJ?=
 =?utf-8?B?bTIwWVBRRjd2OEdQeHljQmVEaFhscW85M0R1VUIwampzWlNxaEtPTmJkcWJO?=
 =?utf-8?B?Uk5GUkwrVTRsMnpicXNIUWZ6VFBwTUYvN1VZOEw4c1JNb0RabFU5Q3BjVzRv?=
 =?utf-8?B?ZEtUakZKa29tMUE2b1B4bHhmMlJ5UENITWlyWVhMdGQ2M2xDTmViRGZGcEk4?=
 =?utf-8?B?SDRRRzNoWHU3QVBGdVRTOVFPVDQyRFpKaUhwcWhxNVlsWUN6ZmRLNjlBVzc1?=
 =?utf-8?B?bVpyVnNnZTZCWlJXcy9ub3h1Q1ErTnJieGJXTnlZR3htY3lNSDN2VWFNMm0z?=
 =?utf-8?B?UGIwY3hzSjRlZFdTSUhxdzRteWpUbzAxczg0VGpGMFVkRFpuRmRvSU0xbjRy?=
 =?utf-8?B?bGh0bEhaN2JTMUFrMnBEQzl5TzZMeFdRMklsVkJhVk9HYnREcFBEdW1COFk4?=
 =?utf-8?B?MnNQUHljUEFveU11aDJQNHpuVXRTV0ZPcVJjN1VrRTBBTG5rYUs3Y3U2SFNO?=
 =?utf-8?B?ZUtlSm9BYmpubFpVQS9JbjlBUVJyT0pxR2pheWg3cURhanltcnBDNHM4am5T?=
 =?utf-8?B?MmxCOGJ6RnkyL1JaUE5UcUZJK0hOYmpHOXlYc3B1N3l2aThYMTR6eEVFUUJB?=
 =?utf-8?B?MGwrN2did0ZqM2dsd3MxS1h1TkdEWDlQVXptektSNjBUTU9qeUNWUEs2bzBi?=
 =?utf-8?B?Z29CUjNnTXVVKzVUbHpIbWZST0V5YjVKV3l0VkZpM3NIZ3Q2MEFCQiszVjRo?=
 =?utf-8?B?NHNWdjNsTzF4TEc0M0htZ0p4WGppUmh4c1JVQkZ2T0EwZjVteXA3c0MyTmNp?=
 =?utf-8?B?cFg1QWlVS2VBV2JOWllhUkhrV1ZpUVJEWnZRakZleWlXVis4MkRFWUczMWVF?=
 =?utf-8?B?cTRCTlNKdHE1K20zL0Y4U2F0bkt0NzA1TnpFdzZyWHVOcGNDRVE0LzJOb0Zy?=
 =?utf-8?B?REE4VjQ3YWhNS2FZOVlHSU43SUhrYjNRNlZiZS9XOTBncXdLUloxdnRIMzhs?=
 =?utf-8?B?Y1hnZUxGS2JOL1dHa3J6ajl5NkhsTURxZ0pMcmM0TjlWOXNhWGtNOG1YNWlI?=
 =?utf-8?B?emVwM1YxTmVHWHIyZzBrRkRaeVBHQmUyU0ptcE8yMmxjREczS3E4dU9tNmdp?=
 =?utf-8?B?d0Nhb3JwY1VKM1JlR3hmYUtNTkhpendPSWRIckpSOEJyVVg3Nkw4bU5BQnhB?=
 =?utf-8?B?WDdrQmFXSlJLSlhyMWtTVm9zVkZsSk5qMUJ4Y2pIKy8yZk5HT3FkcmJoUnNv?=
 =?utf-8?B?Kzc5RG9FbWptczJOdmY5YVI3QXVSUjZvczRkaXVHQVl0S3ZNczlXOGVJNjVk?=
 =?utf-8?B?NkxxSWJ3ZWxDMmpPY1Avems4ell5WkVZcUwzRjJWZTBHbzBsWHpaY2UxeTVC?=
 =?utf-8?B?bkdmdTNGMFI4TmVZQ0RyRG94bFF3VjQ0WVF2ak5PRCtyY3BVQ3MxbUFKWUtH?=
 =?utf-8?B?eEFnai9wNldaQ0M0Y0Fpcjl1VVF6d3Rtb3NMWlhiaDRhZGdyS2g0aElFN0Vz?=
 =?utf-8?B?U3Bwd1lHY0NKOG1KVlNnQVpON2UwVXNFdUFUR3I1S29BSVBOY2F2VE5ZRndv?=
 =?utf-8?B?VnppK0Y2YTVjaEF5TE1QVTRxdUxrVmkydFNoUDlROFhDV2tzTEdpczI1Y2Nr?=
 =?utf-8?B?RE9STEdsbERlaUtsRDgxWlY2YjR6UWNPd3VqV294RkZ4U09EOFVuTWNOdUhV?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dccb96-8b02-4eeb-fdff-08dd72c30865
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 15:20:14.3765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rssSVaKDYPoLzAd7NNJ+3Rr3sL1Jsqq6vhF9eEGRGe3spv9zjMwbur61DlfydPBqC95JFXykN0JHjGvu+j/f8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
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

Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-03-27 11:39 p.m., Matthew Brost wrote:
> On Thu, Mar 27, 2025 at 04:40:27PM -0700, Zhanjun Dong wrote:
>> Add new debugfs entry "guc_log_lfd", which supports output guc log
>> in LFD(Log Format Descriptors) format.
>>
> 
> Not a full review - but couple of drive by comments.
> 
> I suggest trying to split this patch into a series of smaller ones if
> possible. 756 loc is lot for a single patch. Off the top of my head...
> 
> - ABI patches
> - New GuC patch
> - New debugfs entry patch
> 
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h     | 112 +++++++
>>   drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h | 261 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_debugfs.c      |  14 +
>>   drivers/gpu/drm/xe/xe_guc_log.c          | 368 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_log.h          |   1 +
>>   5 files changed, 756 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..50b697e44c42 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -17,6 +17,118 @@ enum guc_log_buffer_type {
>>   
>>   #define GUC_LOG_BUFFER_TYPE_MAX		3
>>   
>> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
>> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
>> +
>> +#define GUC_LOG_INIT_CONFIG_LIC_MAGIC			0x8086900D
>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR	0x0001
>> +#define GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR	0x0000
>> +
>> +/** Log Init Config KLV IDs. */
>> +enum guc_log_lic_type_t {
> 
> '_t' suffix isn't used in the Xe style as typically is used for typedefs
> which are frowned upon in upstream Linux. I'd drop "_t" suffix
> everywhere.

I agree _t is not Xe style, while for this case, the ABI header file is 
follows with GuC spec, which is a cross system/project thing. The name 
here is the secondary defines.
I guess simply follows orginal spec will make things more easy to 
compare and reduce possible mismatches among systems.

> 
>> +	/**
>> +	 * GuC firmware version. Value is a 32 bit number represented by
>> +	 * guc_sw_version_t.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GUC_SW_VERSION = 0x1,
>> +	/**
>> +	 * GuC device id. Value is a 32 bit. Refer BSpec symbol
>> +	 * GUC_DEVICEID
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * GuC timestamp counter frequency. Value is a 32 bit number
>> +	 * representing frequency in kilohertz. This timestamp is utilized
>> +	 * in log entries, timer and for engine utilization tracking.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_TSC_FREQUENCY = 0x3,
>> +	/**
>> +	 * HW GMD ID. Value is a 32 bit number representing graphics,
>> +	 * media and display HW architecture IDs.
>> +	 */
>> +	GUC_LOG_LIC_TYPE_GMD_ID = 0x4,
>> +	/** GuC build platform ID. Value is 32 bits. */
>> +	GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +};
>> +
>> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LOG_LIC_TYPE_GUC_SW_VERSION)
>> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID + 1)
>> +
>> +/** struct guc_klv_generic_t - KLV with multiple DWs in an array */
>> +struct guc_klv_generic_t {
>> +	/** @length: Length in Dwords of data. */
>> +	u16		length;
>> +	/** @key: Key value */
>> +	u16		key;
>> +	/** @value: Value for this key */
>> +	u32		value[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_sw_version_t - This structure describes the full version of
>> + * a software component.
>> + */
>> +struct guc_sw_version_t {
>> +	/** @patch_version: BR[7:0] Patch version */
>> +	u32		patch_version : 8;
>> +	/** @minor_version: BR[15:8] Minor version */
>> +	u32		minor_version : 8;
>> +	/** @major_version: BR[23:16] Major version */
>> +	u32		major_version : 8;
>> +	/** @branch_id: BR[31:24] Branch ID */
>> +	u32		branch_id : 8;
> 
> This needs to be defines if this corresponds to a hardware interface.
> Based on CPU compiler target endians, the bits can get flipped around.
Right, LFD defined in GuC spec is for little endian ONLY. Let me think 
about endian things (output little endian file from big endian system) 
in later revisions.>
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lic_format_version_t - Log Init Config Structure Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_lic_format_version_t {
>> +	/**
>> +	 * @minor_version: BR[15:0] Log-Init-Config structure minor
>> +	 * version. Must be GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR
>> +	 */
>> +	u32		minor_version : 16;
>> +	/**
>> +	 * @major_version: BR[31:16] Log-Init-Config structure major
>> +	 * version. Must be GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR
>> +	 */
>> +	u32		major_version : 16;
> 
> Same here.
> 
>> +} __packed;
>> +
>> +/**
>> + * struct guc_log_init_config_t - GuC Log-Init-Config structure.
>> + * This is populated by the GUC at log init time and is located in the log
>> + * buffer as per the Log Buffer Layout (In Memory). The array of guc log
>> + * buffer states plus this structure must not exceed 4KB
>> + */
>> +struct guc_log_init_config_t {
>> +	/**
>> +	 * @lic_magic: A magic number set by GuC to identify that this
>> +	 * structure contains valid information: lic_magic = 0x8086900D.
>> +	 * Used to verify the information in this structure is valid.
>> +	 */
>> +	u32		lic_magic;
>> +	/**
>> +	 * @lic_ver: The version of the this structure. Detail description
>> +	 * is guc_lic_format_version_t
>> +	 */
>> +	struct guc_lic_format_version_t	lic_ver;
>> +	/** @lic_dw_size: Number of Dws the `lic_data` array contains. */
>> +	u32		lic_dw_size;
>> +	/**
>> +	 * @lic_data: Array of dwords representing a list of LIC KLVs of
>> +	 * type guc_klv_generic_t with keys represented by
>> +	 * guc_log_lic_type_t
>> +	 */
>> +	u32		lic_data[];
> 
> You can use __counted_by(lic_dw_size) for some additional checking.
Good point, will add in next rev.>
>> +} __packed;
>> +
>>   /**
>>    * struct guc_log_buffer_state - GuC log buffer state
>>    *
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> new file mode 100644
>> index 000000000000..8aaacab244cb
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_lfd_abi.h
>> @@ -0,0 +1,261 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GUC_LOG_LFD_ABI_H_
>> +#define _ABI_GUC_LOG_LFD_ABI_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#include "abi/guc_log_abi.h"
>> +
>> +/* Magic keys define */
>> +#define LFD_DRIVER_KEY_STREAMING		0x8086AAAA474C5346
>> +#define LFD_LOG_BUFFER_MARKER_2			0xDEADFEED
>> +#define LFD_CRASH_DUMP_BUFFER_MARKER_2		0x8086DEAD
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_2	0xBEEFFEED
>> +#define LFD_LOG_BUFFER_MARKER_1V2		0xCABBA9E6
>> +#define LFD_STATE_CAPTURE_BUFFER_MARKER_1V2	0xCABBA9F7
>> +
>> +#define GUC_LOGFILE_LFD_MAGIC	upper_16_bits(LFD_CRASH_DUMP_BUFFER_MARKER_2)
>> +
>> +/** The current major version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MAJOR	0x0001
>> +/** The current minor version of GuC-Log-File format. */
>> +#define GUC_LOG_FILE_FORMAT_VERSION_MINOR	0x0000
>> +
>> +/** Log format descriptor type */
>> +enum guc_lfd_type_t {
>> +	/** Start of range for required LFDs from GuC */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_START = 0x1,
>> +	/**
>> +	 * GuC Firmware Version structure. LFDs payload is
>> +	 * guc_lfd_data_fw_version_t
>> +	 */
>> +	GUC_LFD_TYPE_FW_VERSION = 0x1,
>> +	/**
>> +	 * GuC microcontroller device ID. LFDs payload is
>> +	 * guc_lfd_data_guc_devid_t
>> +	 */
>> +	GUC_LFD_TYPE_GUC_DEVICE_ID = 0x2,
>> +	/**
>> +	 * Frequency of GuC timestamps. LFDs payload is
>> +	 * guc_lfd_data_tsc_freq_t
>> +	 */
>> +	GUC_LFD_TYPE_TSC_FREQUENCY = 0x3,
>> +	/** HW GMD ID. LFDs payload is guc_lfd_data_gmdid_t */
>> +	GUC_LFD_TYPE_GMD_ID = 0x4,
>> +	/**
>> +	 * GuC build platform ID. LFDs payload is
>> +	 * guc_lfd_data_build_platformid_t
>> +	 */
>> +	GUC_LFD_TYPE_BUILD_PLATFORM_ID = 0x5,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_FW_REQUIRED_RANGE_END = 0x1FFF,
>> +	/** Start of range for required LFDs from GuC */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_START = 0x2000,
>> +	/**
>> +	 * Log-event-entries buffer. LFDs payload is
>> +	 * guc_lfd_data_log_events_buf_t
>> +	 */
>> +	GUC_LFD_TYPE_LOG_EVENTS_BUFFER = 0x2000,
>> +	/**
>> +	 * GuC generated crash-dump blob. LFDs payload is
>> +	 * guc_lfd_data_fw_crashdump_t
>> +	 */
>> +	GUC_LFD_TYPE_FW_CRASH_DUMP = 0x2001,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_FW_OPTIONAL_RANGE_END = 0x3FFF,
>> +	/** Start of range for required KMD LFDs */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_START = 0x4000,
>> +	/**
>> +	 * An identifier for the OS. LFDs payload is guc_lfd_data_os_id_t
>> +	 */
>> +	GUC_LFD_TYPE_OS_ID = 0x4000,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_KMD_REQUIRED_RANGE_END = 0x5FFF,
>> +	/** Start of range for optional KMD LFDs */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_START = 0x6000,
>> +	/**
>> +	 * Binary representation of GuC log-events schema. LFDs TLV
>> +	 * payload is guc_lfd_data_binary_schema_t
>> +	 */
>> +	GUC_LFD_TYPE_BINARY_SCHEMA_FORMAT = 0x6000,
>> +	/**
>> +	 * ASCII string containing comments from the host/KMD. LFDs TLV
>> +	 * payload is guc_lfd_data_host_comment_t
>> +	 */
>> +	GUC_LFD_TYPE_HOST_COMMENT = 0x6001,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_KMD_OPTIONAL_RANGE_END = 0x7FFF,
>> +	/** Start of reserved range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_START = 0x8000,
>> +	/** End of this range */
>> +	GUC_LFD_TYPE_RESERVED_RANGE_END = 0xFFFF,
>> +};
>> +
>> +/** OS Type LFD-ID */
>> +enum guc_lfd_os_type_t {
>> +	/** Windows OS */
>> +	GUC_LFD_OS_TYPE_OSID_WIN = 0x1,
>> +	/** Linux OS */
>> +	GUC_LFD_OS_TYPE_OSID_LIN = 0x2,
>> +	/** VMWare OS */
>> +	GUC_LFD_OS_TYPE_OSID_VMW = 0x3,
>> +	/** Other */
>> +	GUC_LFD_OS_TYPE_OSID_OTHER = 0x4,
>> +};
>> +
>> +/**
>> + * struct guc_logfile_lfd_t - Log format descriptor (LFD).
>> + * A type of KLV with custom field-sizes + magic numbers.
>> + */
>> +struct guc_logfile_lfd_t {
>> +	/**
>> +	 * @magic: BR[15:0] Expected value: 0x8086. Helpful in detecting
>> +	 * file errors.
>> +	 */
>> +	u32		magic : 16;
>> +	/**
>> +	 * @desc_type: BR[31:16] File descriptor type (the 'T' in TLV) is
>> +	 * used to identify how to interpret `data` below. For the range
>> +	 * of types, see guc_lfd_type_t
>> +	 */
>> +	u32		desc_type : 16;
> 
> Defines as above if this is hardware interface.
Will handle endian things in later revisions.>
>> +	/** @desc_dw_size: Number of dwords the `data` field contains. */
>> +	u32		desc_dw_size;
>> +	/** @data: Data defined by File descriptor type. */
>> +	u32		data[];
> 
> __counted_by(desc_dw_size);
> 
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_fmt_ver_t - GuC Log File Format Version.
>> + * Major-Minor is not a fractional number (i.e. Ver 1.3 would be older
>> + * than 1.12)
>> + */
>> +struct guc_logfile_fmt_ver_t {
>> +	/**
>> +	 * @minor_version: BR[15:0] Guc-Log-File Format minor version.
>> +	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MINOR
>> +	 */
>> +	u32		minor_version : 16;
>> +	/**
>> +	 * @major_version: BR[31:16] Guc-Log-File Format major version.
>> +	 * Must be GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +	 */
>> +	u32		major_version : 16;
> 
> Defines as above if this is hardware interface.
> 
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_guc_devid_t - GuC Device ID.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_guc_devid_t {
>> +	/**
>> +	 * @guc_devid: GuC microcontroller device ID defined as described
>> +	 * in GUC_LOG_LIC_TYPE_GUC_DEVICE_ID
>> +	 */
>> +	u32		guc_devid;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_tsc_freq_t - GuC TSC Fequency.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_tsc_freq_t {
>> +	/**
>> +	 * @tsc_freq: GuC timestamp counter frequency as described in
>> +	 * GUC_LOG_LIC_TYPE_TSC_FREQUENCY
>> +	 */
>> +	u32		tsc_freq;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_gmdid_t - GMD ID. */
>> +struct guc_lfd_data_gmdid_t {
>> +	/** @gmd_id: GMD ID as described in GUC_LOG_LIC_TYPE_GMD_ID */
>> +	u32		gmd_id;
>> +} __packed;
>> +
>> +/** struct guc_lfd_data_build_platformid_t - GuC build platform ID. */
>> +struct guc_lfd_data_build_platformid_t {
>> +	/**
>> +	 * @platform_build_id: GuC build platform ID as described in
>> +	 * GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID
>> +	 */
>> +	u32		platform_build_id;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_log_events_buf_t - GuC Log Events Buffer.
>> + * This is optional fw LFD data
>> + */
>> +struct guc_lfd_data_log_events_buf_t {
>> +	/**
>> +	 * @log_events_format_version: version of GuC log format of buffer
>> +	 */
>> +	u32		log_events_format_version;
>> +	/**
>> +	 * @log_format_buf: If `log_format_version` == 1, array of
>> +	 * guc_log_format_version_1_t. If `log_format_version` == 2, array
>> +	 * of guc_log_format_version_2_t. Dword size determined by
>> +	 * guc_logfile_lfd_t.`desc_dw_size` - 1
>> +	 */
>> +	u32		log_format_buf[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_os_id_t - OS Version Information.
>> + * This is mandatory host LFD data
>> + */
>> +struct guc_lfd_data_os_id_t {
>> +	/**
>> +	 * @os_id: enum values to identify the OS brand (1=Windows,
>> +	 * 2=Linux, etc..). See guc_lfd_os_type_t for the range of types
>> +	 */
>> +	u32		os_id;
>> +	/**
>> +	 * @build_version: ASCII string containing OS build version
>> +	 * information based on os_id. String is padded with null
>> +	 * characters to ensure its DWORD aligned. Dword size determined
>> +	 * by guc_logfile_lfd_t.`desc_dw_size` - 1
>> +	 */
>> +	char		build_version[];
>> +} __packed;
>> +
>> +/**
>> + * struct guc_logfile_t - GuC Log Streaming-LFD-File Format.
>> + * This structure encapsulates the layout of the guc-log-file format
>> + */
>> +struct guc_logfile_t {
>> +	/**
>> +	 * @magic: A magic number set by producer of a GuC log file to
>> +	 * identify that file is a valid guc-log-file containing a stream
>> +	 * of LFDs: Expected value: 0x8086AAAA474C5346.
>> +	 */
>> +	u64		magic;
>> +	/**
>> +	 * @version: Version of this file format layout as per
>> +	 * guc_logfile_fmt_ver_t
>> +	 */
>> +	struct guc_logfile_fmt_ver_t	version;
>> +	/**
>> +	 * @lfd_stream: A stream of one or more guc_logfile_lfd_t LFD data
>> +	 */
>> +	struct guc_logfile_lfd_t	lfd_stream;
>> +} __packed;
>> +
>> +/**
>> + * struct guc_lfd_data_fw_version_t - GuC FW Version.
>> + * This is mandatory fw LFD data
>> + */
>> +struct guc_lfd_data_fw_version_t {
>> +	/**
>> +	 * @guc_sw_version: The full version of the GuC microkernel that
>> +	 * generated the logs as described in
>> +	 * GUC_LOG_LIC_TYPE_GUC_SW_VERSION.
>> +	 */
>> +	struct guc_sw_version_t	guc_sw_version;
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> index c569ff456e74..6449c9a69b8a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
>> @@ -48,6 +48,19 @@ static int guc_log(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int guc_log_lfd(struct seq_file *m, void *data)
>> +{
>> +	struct xe_guc *guc = node_to_guc(m->private);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	xe_pm_runtime_get(xe);
>> +	xe_guc_log_print_lfd(&guc->log, &p);
>> +	xe_pm_runtime_put(xe);
>> +
>> +	return 0;
>> +}
>> +
>>   static int guc_log_dmesg(struct seq_file *m, void *data)
>>   {
>>   	struct xe_guc *guc = node_to_guc(m->private);
>> @@ -89,6 +102,7 @@ static int guc_pc(struct seq_file *m, void *data)
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"guc_info", guc_info, 0},
>>   	{"guc_log", guc_log, 0},
>> +	{"guc_log_lfd", guc_log_lfd, 0},
>>   	{"guc_log_dmesg", guc_log_dmesg, 0},
>>   	{"guc_ctb", guc_ctb, 0},
>>   	{"guc_pc", guc_pc, 0},
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index 80514a446ba2..5659d60e41ab 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -7,8 +7,12 @@
>>   
>>   #include <linux/fault-inject.h>
>>   
>> +//#include <generated/utsversion.h>
>> +//#include "boot.h"
>> +#include <linux/utsname.h>
>>   #include <drm/drm_managed.h>
>>   
>> +#include "abi/guc_log_lfd_abi.h"
>>   #include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_devcoredump.h"
>> @@ -19,6 +23,57 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +static struct guc_log_buffer_entry_markers {
>> +	u32 key[2];
>> +} const entry_markers[4] = {
>> +	{{
>> +		LFD_LOG_BUFFER_MARKER_1V2,
>> +		LFD_LOG_BUFFER_MARKER_2
>> +	}},
>> +	{{
>> +		LFD_LOG_BUFFER_MARKER_1V2,
>> +		LFD_CRASH_DUMP_BUFFER_MARKER_2
>> +	}},
>> +	{{
>> +		LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
>> +		LFD_STATE_CAPTURE_BUFFER_MARKER_2
>> +	}},
>> +	{{
>> +		GUC_LOG_INIT_CONFIG_LIC_MAGIC,
>> +		((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
>> +			| GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
>> +	}}
>> +};
>> +
>> +static struct guc_log_buffer_entry_list {
>> +	u32 offset;
>> +	u32 rd_ptr;
>> +	u32 wr_ptr;
>> +	u32 buf_size;
>> +} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
>> +
>> +static const struct guc_logfile_lfd_t default_guc_logfile_lfd = {
>> +	.magic = GUC_LOGFILE_LFD_MAGIC,
>> +};
>> +
>> +static const struct guc_logfile_t default_guc_logfile = {
>> +	.magic = LFD_DRIVER_KEY_STREAMING,
>> +	.version = {
>> +		.minor_version = GUC_LOG_FILE_FORMAT_VERSION_MINOR,
>> +		.major_version = GUC_LOG_FILE_FORMAT_VERSION_MAJOR
>> +	}
>> +};
>> +
>> +struct guc_log_init_config_save_t {
>> +	/*
>> +	 * Array of init config KLVs.
>> +	 * Range from GUC_LOG_LIC_TYPE_FIRST to
>> +	 * GUC_LOG_LIC_TYPE_LAST
>> +	 */
>> +	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
>> +	struct guc_log_buffer_state log_buf_state;
>> +};
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -216,6 +271,305 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	}
>>   }
>>   
>> +static int xe_guc_log_add_lfd_header(char *buf, int buf_size)
>> +{
>> +	int len;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t))
>> +		return -ENOMEM;
>> +
>> +	len = sizeof(default_guc_logfile_lfd);
>> +	memcpy(buf, &default_guc_logfile_lfd, len);
>> +
>> +	return len;
>> +}
>> +
>> +static int xe_guc_log_add_payload(char *buf, int buf_size, u32 data_len, void *data)
>> +{
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
>> +		return -ENOMEM;
>> +
>> +	/* make length DW aligned */
>> +	lfd->desc_dw_size = data_len / 4;
> 
> s/4/sizeof(u32)

Sure, will be replaced in next rev.>
> Matt
> 
>> +	if (data_len % 4)
>> +		lfd->desc_dw_size++;
>> +
>> +	if (lfd->data != data)
>> +		memcpy(lfd->data, data, data_len);
>> +
>> +	return lfd->desc_dw_size * 4;
>> +}
>> +
>> +static int xe_guc_log_add_typed_payload(char *buf, int buf_size, u32 type,
>> +					u32 data_len, void *data)
>> +{
>> +	int len;
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
>> +		return -ENOMEM;
>> +
>> +	len = xe_guc_log_add_lfd_header(buf, buf_size);
>> +	lfd->desc_type = type;
>> +	len += xe_guc_log_add_payload(buf, buf_size, data_len, data);
>> +
>> +	return len;
>> +}
>> +
>> +static int xe_guc_log_add_os_id(char *buf, int buf_size, u32 id)
>> +{
>> +	char *version;
>> +	int info_len;
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +	struct guc_lfd_data_os_id_t *os_id = (struct guc_lfd_data_os_id_t *)lfd->data;
>> +
>> +	os_id->os_id = id;
>> +
>> +	version = init_utsname()->release;
>> +	info_len = strlen(version) + 1;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + info_len)
>> +		return -ENOMEM;
>> +
>> +	strscpy(os_id->build_version, version, info_len);
>> +
>> +	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
>> +					   info_len + sizeof(*os_id), os_id);
>> +}
>> +
>> +static int
>> +xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
>> +			 struct guc_log_init_config_save_t *config)
>> +{
>> +	int len;
>> +	char *data;
>> +	u32 data_len;
>> +	struct guc_lfd_data_log_events_buf_t *events_buf;
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +	struct guc_log_buffer_entry_list *entry;
>> +
>> +	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
>> +
>> +	/* Skip empty log */
>> +	if (entry->rd_ptr == entry->wr_ptr)
>> +		return 0;
>> +
>> +	len = xe_guc_log_add_lfd_header(buf, buf_size);
>> +	if (len < 0)
>> +		return len;
>> +
>> +	buf_size -= len;
>> +	lfd = (struct guc_logfile_lfd_t *)buf;
>> +
>> +	lfd->desc_type = GUC_LFD_TYPE_LOG_EVENTS_BUFFER;
>> +	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
>> +	events_buf->log_events_format_version = config->log_buf_state.version;
>> +
>> +	data = log_bin + entry->offset + entry->rd_ptr;
>> +	if (entry->rd_ptr < entry->wr_ptr) {
>> +		data_len = entry->wr_ptr - entry->rd_ptr;
>> +		if (data_len <= buf_size) {
>> +			memcpy(events_buf->log_format_buf, data, data_len);
>> +			buf_size -= data_len;
>> +		} else {
>> +			return -ENOMEM;
>> +		}
>> +	} else {
>> +		int cp_len;
>> +
>> +		/* Copy rd to buf end 1st */
>> +		data_len = entry->buf_size - entry->rd_ptr;
>> +		if (data_len <= buf_size) {
>> +			memcpy(events_buf->log_format_buf, data, data_len);
>> +			buf_size -= data_len;
>> +		} else {
>> +			return -ENOMEM;
>> +		}
>> +
>> +		/* Copy buf start to wr */
>> +		data = &log_bin[entry->offset];
>> +		cp_len = entry->wr_ptr;
>> +		if (cp_len <= buf_size - cp_len)
>> +			memcpy(&events_buf->log_format_buf[data_len / 4], data, cp_len);
>> +		else
>> +			return -ENOMEM;
>> +		data_len += cp_len;
>> +	}
>> +
>> +	/* make length DW aligned */
>> +	lfd->desc_dw_size = data_len / 4;
>> +	if (data_len % 4)
>> +		lfd->desc_dw_size++;
>> +
>> +	/* Addup log_events_format_version size */
>> +	lfd->desc_dw_size++;
>> +
>> +	return len + lfd->desc_dw_size * 4;
>> +}
>> +
>> +static inline int lic_type_to_KLV_index(u32 lic_type)
>> +{
>> +	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >= GUC_LOG_LIC_TYPE_LAST);
>> +
>> +	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
>> +}
>> +
>> +static int xe_guc_log_add_klv(char *buf, int size, u32 lic_type,
>> +			      struct guc_log_init_config_save_t *config)
>> +{
>> +	/* LFD type must matches LIC type */
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_FW_VERSION != (int)GUC_LOG_LIC_TYPE_GUC_SW_VERSION);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GUC_DEVICE_ID != (int)GUC_LOG_LIC_TYPE_GUC_DEVICE_ID);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_TSC_FREQUENCY != (int)GUC_LOG_LIC_TYPE_TSC_FREQUENCY);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GMD_ID != (int)GUC_LOG_LIC_TYPE_GMD_ID);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_BUILD_PLATFORM_ID !=
>> +		     (int)GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID);
>> +
>> +	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
>> +				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
>> +}
>> +
>> +static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
>> +				     struct guc_log_init_config_save_t *config)
>> +{
>> +	int i;
>> +	struct guc_klv_generic_t *p = (struct guc_klv_generic_t *)init->lic_data;
>> +
>> +	memset(entry_list, 0, sizeof(entry_list));
>> +
>> +	for (i = 0; i < init->lic_dw_size;) {
>> +		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >= GUC_LOG_LIC_TYPE_LAST)
>> +			break;
>> +		config->KLV[lic_type_to_KLV_index(p->key)] = p->value[0];
>> +		i += p->length + 1; /* +1DW to include kev(u16) and len(u16) */
>> +		p = (struct guc_klv_generic_t *)((u32 *)p + p->length + 1);
>> +	}
>> +}
>> +
>> +static void xe_guc_log_load_log_buffer(u32 *guc_log, int len,
>> +				       struct guc_log_init_config_save_t *config)
>> +{
>> +	int i = 0;
>> +	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
>> +	struct guc_log_buffer_state *p = (struct guc_log_buffer_state *)guc_log;
>> +
>> +	while (p) {
>> +		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
>> +			if (p->marker[0] == entry_markers[i].key[0] &&
>> +			    p->marker[1] == entry_markers[i].key[1]) {
>> +				entry_list[i].offset = offset;
>> +				entry_list[i].rd_ptr = p->read_ptr;
>> +				entry_list[i].wr_ptr = p->write_ptr;
>> +				entry_list[i].buf_size = p->size;
>> +
>> +				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
>> +					config->log_buf_state = *p;
>> +
>> +				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
>> +					offset += p->size;
>> +					p++;
>> +				} else {
>> +					/* Load log init config */
>> +					xe_guc_log_loop_log_init((struct guc_log_init_config_t *)p,
>> +								 config);
>> +
>> +					/* Init config is the last */
>> +					return;
>> +				}
>> +			}
>> +		}
>> +		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
>> +			break;
>> +	}
>> +}
>> +
>> +static uint xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
>> +				       struct xe_guc_log *log,
>> +				       struct guc_log_init_config_save_t *config)
>> +{
>> +	int index = 0, len = 0;
>> +	char *bin = (char *)guc_log_bin;
>> +	struct guc_logfile_t *guc_logfile;
>> +
>> +	if (size < sizeof(struct guc_logfile_t))
>> +		return -ENOMEM;
>> +
>> +	guc_logfile = (struct guc_logfile_t *)buf;
>> +	*guc_logfile = default_guc_logfile;
>> +	index = offsetof(struct guc_logfile_t, lfd_stream);
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_FW_VERSION, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_GUC_DEVICE_ID, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_TSC_FREQUENCY, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_GMD_ID, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
>> +				 config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_os_id(&buf[index], size - index, GUC_LFD_OS_TYPE_OSID_LIN);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_log_event(&buf[index], size - index, bin, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	return index;
>> +}
>> +
>> +static void
>> +xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>> +			      struct xe_guc_log *log)
>> +{
>> +	size_t remain;
>> +	int i;
>> +	struct guc_log_init_config_save_t init_config;
>> +
>> +	if (!snapshot)
>> +		return;
>> +
>> +	remain = snapshot->size;
>> +	for (i = 0; i < snapshot->num_chunks; i++) {
>> +		int len = 0;
>> +		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> +		char *lfd_buf = kzalloc(size, GFP_KERNEL);
>> +
>> +		/* load from log bin */
>> +		xe_guc_log_load_log_buffer(snapshot->copy[i], size, &init_config);
>> +		/* Conver to LFD format */
>> +		len = xe_guc_log_save_to_lfd_buf(lfd_buf, size, snapshot->copy[i], log,
>> +						 &init_config);
>> +		if (len > 0)
>> +			xe_print_blob_ascii85(p, "[LOG].data", 0, lfd_buf, 0, len);
>> +		kfree(lfd_buf);
>> +		XE_WARN_ON(len <= 0);
>> +
>> +		remain -= size;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
>>    * @log: GuC log structure
>> @@ -251,6 +605,20 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>   	xe_guc_log_snapshot_free(snapshot);
>>   }
>>   
>> +/**
>> + * xe_guc_log_print_lfd - dump a copy of the GuC log to some useful location
>> + * @log: GuC log structure
>> + * @p: the printer object to output to
>> + */
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p)
>> +{
>> +	struct xe_guc_log_snapshot *snapshot;
>> +
>> +	snapshot = xe_guc_log_snapshot_capture(log, false);
>> +	xe_guc_log_snapshot_print_lfd(snapshot, p, log);
>> +	xe_guc_log_snapshot_free(snapshot);
>> +}
>> +
>>   int xe_guc_log_init(struct xe_guc_log *log)
>>   {
>>   	struct xe_device *xe = log_to_xe(log);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
>> index 5b896f5fafaf..37ff4d11e6cf 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -40,6 +40,7 @@ struct xe_device;
>>   
>>   int xe_guc_log_init(struct xe_guc_log *log);
>>   void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>> +void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>>   void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>>   struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
>>   void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
>> -- 
>> 2.34.1
>>

