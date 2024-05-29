Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED13BC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826BC10E14C;
	Wed, 29 May 2024 18:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKxWm7Sp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011010E14C
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717008592; x=1748544592;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TnRFqAS0un68w90AF0h5hCpBAzJcov6AjnTAK3p6h9U=;
 b=bKxWm7Sp9jRJ6jUm/avfaQASYa55ODoxk1opDOPkKZkEYyl3HbpAi6GX
 +ivFxLA9xQA5PHGHXUOSFEGpDkRsFLdGueVPAW7cIWg98/NK/2GTVvoRK
 kL3Cm3UpqlUab1eeGyi9v6fm3thaRmQjOktbpR8PnBY32Vii2zg+TMqAx
 GRCQAwW+ncrkhkqa9uX5oFCClftRmQVffE5M9FEc+g7gBcNdTpqjpRJE/
 ULiY40h9MbpLwKOPKlVEls0l9Jj1X+Doiq1RFP6hD8wLXI1l5wdmNEWuV
 en1EnEvviPVfnr1zU6Wr97ayqVndL7nxWAXvEkYrlJDzG+5tm4P1Y+JZD A==;
X-CSE-ConnectionGUID: pnwS4ZhxRHecGF/X2hcyMg==
X-CSE-MsgGUID: 4USF9VsbSZqXEnWPukDLeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13311146"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13311146"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:49:52 -0700
X-CSE-ConnectionGUID: Cah7P11tTBSl0jYp3UASxw==
X-CSE-MsgGUID: yih8d7ReQKq32OSMt5gv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40055810"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 11:49:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 11:49:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 11:49:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 11:49:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMXivQBKgogMygSWB/kxNP2KPhWe+XsrH5hxE+AAnTynv8LjaCi4SvtjyHANDDtwQq4VFvYkq9lBW+mIfCiSOXB6uzaJ57RoEipkjhSh7/vw0u9pddJu0GzISxrzoaah2nQo6b/VdTkTLF9DzhDDfSTtER3PQL52pSjIWW/smWwrCrhTlU1R1P58+iQHsL2Fa4nlhV0RTwFm2WsPJhBDCwY+7sCD4qakiwcCN6x7kWuqD7cPa5NvAKuiMoUgjL9s5ZJnorgCRN8h2amUwrdGhQPtAH3UlbSRNdYZf0ZenGFNYNGpuIFspdGXOTUhRV1OEni8F6l02D4+4hqzOoun/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJPL8f8CkWHYJPsgYavl6YyvV+DlF5hZC3zok8zwMSE=;
 b=a4l4eqsKnzMsKQWmqqzHl9HEBNBcGKPZsZbEzJAhia4ib24kafMAV+pafHZifNiU2pkrP2qX9xoxbhCNiCz78syryZYbgcpGGLEVgN8rJGOKhcTO3+KvFxU11v+hsOhQn7VJE1caQQ7WD1VLTZ/Kkt0OoLpzSvnl3pO5AehweRZbGUDHR57Dpj+EqGPVB7fIvoSBQhil7JKQ909H9tAgb+cy0I5rVyqlJt3g8oxipebGqA1Tw0ooyuTkBGpyGst1ALwGl+0n7nhdyyhJyuNTFirri2yJWpTjnOC260Ip45+bRZdTJ5mERXxb13F3HMCgWbqRjTm9SOltfipn9V/fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by PH0PR11MB7447.namprd11.prod.outlook.com (2603:10b6:510:28b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 18:49:45 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%3]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 18:49:45 +0000
Message-ID: <50f7bef5-178f-4ac9-9b41-fcadacaa07d8@intel.com>
Date: Wed, 29 May 2024 11:49:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Remove unwanted mutex locking
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20240529183319.19731-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|PH0PR11MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: 9adf678d-47b2-4739-09fb-08dc80101bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTBneGNHRG1Ma0pSV2dHa3E5NmZ6cjFscU0wa0g5VWdPVUNuWVRqTEtLUXdD?=
 =?utf-8?B?dkpkakVPUEVVS2QrK1hpMnJmMVdlbDhFZ2hLaHlJZ3Evbk12SjlNbFFCVVIy?=
 =?utf-8?B?amxYU0dOZFM0SENHcE14R0FPM0dnYUF0QVpwbms0Z0tYaUw0UE13OHd0UzNm?=
 =?utf-8?B?aWQrTm9maGhwdmFESDAzRTFBYVJHT0VzV2V1bVYybDFkeUJKYXdNYVo2T1pF?=
 =?utf-8?B?YVZXSUN6UEhKYjVpVUhFZEF3c3BwdHJrRG9GQ2RGYlJwalVIb3hRM05RNmIw?=
 =?utf-8?B?cms1eUtBV3hNUXhuM1BBUjdyblpYZHRwbkQvRERPTGdiM0pKRkRPUVVMQ0gw?=
 =?utf-8?B?ZlIwdzVmV1RUWkVrMHJJeU1vNGU1ak9QOXhBaUhVdlVoMEVVZCtPMlRvbmhK?=
 =?utf-8?B?SGgvWHhObVp1THUvc3hmZXptcms5QksrOWdVakZDd0U5dWEvS1RXSzR5N0ts?=
 =?utf-8?B?Q2ozSVR6aHhSdXpucS95dVZnVnErVnFwTGdYVnhPcVRJV1k5ZkpUUmxjeURu?=
 =?utf-8?B?d1hQUDhEUEI0K3gybk5MVllBSmlpNEkvOUZTNkRNMENka2wvS2NoOGlSLzNw?=
 =?utf-8?B?RVUzazZBVmdMSldPbGMwMm1WNGtlOVFRUkxYMkNrc3dVcGNRSW44dXJjLzRQ?=
 =?utf-8?B?Rit2eW9Sc09GUHRvT3FZYzVGbWZJY3ZkNFFFakovQTFhMUpnVmZGelA4ekNV?=
 =?utf-8?B?YXZJb3hZZG1GTTVJZzRPWlMrNm5XcDFtcDc1c1lPNjQ1aDRmREx0eGViYjcz?=
 =?utf-8?B?ZWNwNDFZY3pDYmdrbi84dTRCb2toTlVCR054VnUxZGdESW94NXpSMnR4Y0ds?=
 =?utf-8?B?WnVZMWdEUjFDeXlQa0pJdHd2N1hrcmUwbkEzM0ZsM2VUQTMwRkRlaDBkWm5U?=
 =?utf-8?B?RjVmaDg2RWIwdGtoUkx1bXU5TGNRY05aREltNWpCVVBLT2o2ZTEvcEN3c3hP?=
 =?utf-8?B?SllZWmVBNFdQeVR5Sm5PU2t2dWw5dFNPUUVacFByaFlUbkJSV0Zia2dWK3FB?=
 =?utf-8?B?eFZGTjEwK3lJUmFzQWtjTCtiWVlTc1FGTEcrYUhQZjBHQnVGSzZaZ2YyNlU3?=
 =?utf-8?B?RVo1ZU03VGp1eVJCQVB3VlMxT3I1b0YraFE0SUMvaTJQODVXbWdOTEFob2F1?=
 =?utf-8?B?dkw2UG54b0Q0SXhZbGJVWXVlQk1WdS9NaGhmUmNMSEhrZWwxTWtKc2Z3Q1Q3?=
 =?utf-8?B?clVVeEZNQ05qdHpOeTZZcUJsZ1doZjJOMTU2NTZVdTlCUVJCNHFhcTBDNkFU?=
 =?utf-8?B?WFlOTDdFQ0I5UnJyRDBvTkJNc1ZzdE1LeXJrUlNJMllTWjZkM0g0aUdWNzlV?=
 =?utf-8?B?UHhUWkFVeTl6WVNYQUtaenl0UWdTbTlRcVB6VTMxMDMrTlo4ZndYdGtKbDVy?=
 =?utf-8?B?VnZvSkxlSU1kOFllWVREK0tlZDlHcnZza0Y3ZDhKMldMdHNuR1lrOVd6alRh?=
 =?utf-8?B?NXBsVkJsTktTV2hMY1pONlJpclorZmYxU2l6T2MwZjRZUXlKY01GNG1oNDZt?=
 =?utf-8?B?Q0NDMDV1LzUyTmJYVk1ZdmtBZ3IrK3hKTDEvV0k0SWVpT1Vad1VXMlZqUG9Q?=
 =?utf-8?B?Q1RaSXZuZW9YZ3ZRZndnVU1OTHoxMHdyNi9JTVlPdzV0MmppeExzT0NXMXNa?=
 =?utf-8?B?KzA0SG00SXltOTV2bFpYaW1jNzZoMEhkN3NlQmw0cXNHTk5FZXJjaVVoc21I?=
 =?utf-8?B?OC9naG02UmRMR0hMMnM0TTFTTXI2d2diZ090MDNRWEJvMnhzOE0wUXh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3NJOWk3OFgyKzcwWWx0cStwZUkvTjRuSVpSTEZVN2l1ZG5id0p4S3VKdlF4?=
 =?utf-8?B?MlZEcGE1dHVlUHVPMnViYVJodG5Na3lmQkFJeEUxeCtaWHBBMkVpZWNCdm9w?=
 =?utf-8?B?UVBmWExzTWFia2dRWHdaeXdIY3RNWDZRMEhuNEVxWkw5Nkpld0hHWCs3ZnRM?=
 =?utf-8?B?cmZVdkZGQ2VHMkpVN1cram41VGdYOERTT0x6bzZ3K2I5dDZOOFdacVgyRFNI?=
 =?utf-8?B?QTB3VFpsazVuODUwbC8yMUx5UWZYcllobnNUUDRvN2srU01aM2tSOW1JVkY4?=
 =?utf-8?B?QVNUcFhwZitMRS9TdU9KUGR1Rk1DQ05MU3N2a2FhT3MyNDB6WG5SRHJsL215?=
 =?utf-8?B?VXZTbVJwZUwzWVVrSXRpRjRhQkVJVWpkNnZVSy84TjB6VEVmcnJnTk9hRE1S?=
 =?utf-8?B?UEpaSFErM3dBTnJHalJWdmtqUWhCR2FiMGsrYjY4WGN0QytPQm9IM1FPZXhZ?=
 =?utf-8?B?dWZRNlQwdytUaWxrVWNTalVwaGFnWXowRnFRdkw4LytnVzFpcU9SdDFBak13?=
 =?utf-8?B?d3QxYXErTGpUbDhVclFlMjdnMjVMMUdPK2k1a3JnQjY2THFnQ2MyUitRUzlD?=
 =?utf-8?B?OVYzT1U3T2lqbk5CWXpxdzM0ckF4aEpSZ1orN05IS3RDU0V5TmNpK3BZOCsv?=
 =?utf-8?B?UWlEdTBORytabXFzY1pJSjB5a0Viay84b1ZwK0dKOFpOdTZkdW1aUHcvMXNB?=
 =?utf-8?B?cnZQdEZuUXlrMDFoV3k2UmVYNU9hYXpHdk1GREUvOFgyUnFldXY3QkN2bmZW?=
 =?utf-8?B?NUFZOHgrOVBOK3dHNmQ2V0J6cFg4MG1tcjFyUVNiZk5TdDcyVFNNUEwxbXRu?=
 =?utf-8?B?NjZka2t2Y1Q3RFZhSnNiTXpScS9xd25Mbk93UE5wd0c0ZE9ydDBmcWs5dHdY?=
 =?utf-8?B?MjdWRk9JMFVvRTd4bGpscE9uUks2d2ozOG92QlFTNTYxekVKUHB3amZJVU4x?=
 =?utf-8?B?ZEtIUmNPZ29pM3o4K3pqbGVJVG9PQjFQRzU3OGxDaEs1SjQ5MmM5cnJsVXZ1?=
 =?utf-8?B?MVlRR01CNTg1Rk9Pc1pJanoyNGlrVkpNUVpZRmVYTTRZUld4Z1pRdDBlK3dQ?=
 =?utf-8?B?bDRrMkFGQkNIUkxISnBnelN6Nkp5ZDllU2tCUUFXUXJKaHVTRm0zM1graFJ3?=
 =?utf-8?B?bjZLM243eWtmU0t4M0lkYUMyYnVLZ3ZoRG9DSzNwQ25ma1cwNUtyU0RLOW1u?=
 =?utf-8?B?NnEvYUJqYXNDSkxxM3FFN3daUDJLaUtJUFNQSEErdWpSS0VLNlRkL25pTG1t?=
 =?utf-8?B?bE5WQXhNWUw0aGk5Mkh0L2d4dDNXQW9yZGlCa0J3M3V3UGtGMWZkOUxDaFR6?=
 =?utf-8?B?Qkppc2FNS3RFam03WS9NaVdjd3kycW4xOUZTeFVXYmd4aVc0Wld0blJxVUZw?=
 =?utf-8?B?aGppbjMvckNlSDdTdlE0eU9QOGh3Q24vLzVWWm1Xbk9xUE9IbUlyQ2ZYZ1RX?=
 =?utf-8?B?NW9YZlFiUllFZkl3WERPa1loajJJVkREV3RxSlk0WkRqWnFsM0FHUzdPR2pq?=
 =?utf-8?B?ZVNCSWVZZy9HS0dtQ2xXZHpHc2VObkowdUpXN0VyWDJ6eHU2TDBvR2RsVHdD?=
 =?utf-8?B?RGtuQ1NDK21CZTdjNVpIZUJjY2FuZXoyM2JQNXRmK1FrUTVMUlAvNUtwT01h?=
 =?utf-8?B?SXNQL2l2bGFZVWZPR1h1TUdrYllPL3RxUUlML2pBZllrZXZiOTM5dThyU2hw?=
 =?utf-8?B?a2pQWWM0OXk2NE4zUmJBTDAyVzFvdE1mV3pNaGVacFl1TFVvMDRMNjlCa3gx?=
 =?utf-8?B?a280MlBlMktlU3NyaFdaWlJmVUQyZTVwaFZmREdUK1hUdFg1cXdadVdMbFRh?=
 =?utf-8?B?emZ0VXdZR1Y2NWhXL2UzMmxQR2RldEhLZGQ0NERDamd6SlFPMExTdHBDZ011?=
 =?utf-8?B?OGxyS1JIN1BRWnZRNW8rT0p2NHR2eStMeDFLeGgrb1lXaklkUkZHQkpRcitu?=
 =?utf-8?B?SjJ1THdYK3R0b3YrcGJyOUd0ZDJLU1FvR1hmenNybDRHNXlEcDFUSmtJZ20y?=
 =?utf-8?B?bXhsM0lxWi90b2Q0QW5ZSXcyYVJmOCtQeHNIbUNDWGNwRmlqY0ZzRmtRc21t?=
 =?utf-8?B?TElLUVBRek4vM3h0R2wweC9qbHROMXBvTFVORGw3ZmtZSCtZTFh0TjBhWGtx?=
 =?utf-8?B?bEJhN1d1THA4R1hGY2hkL1FVbHFvNmFKd1JZbVFtbFFYZzRqbmZ0VnJrdHh4?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adf678d-47b2-4739-09fb-08dc80101bf0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 18:49:45.7525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYMYW2c97MSyA0qsB7LoQA4SwjVr0THW7gfC2e2bU9em7cP8DiZEIXFsLdsnVcPwo9Z1K9dudHNMMHHhSWflesjiotYaG+RVnyw9Oo3g8e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7447
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


On 5/29/2024 11:33 AM, Niranjana Vishwanathapura wrote:
> Do not hold xef->exec_queue.lock mutex while parsing the xarray
> xef->exec_queue.xa in xe_file_close() as it is not needed and
> will cause an unwanted dependency between this lock and the vm->lock.
>
> This lock protects the exec queue lookup and reference taking which
> doesn't apply to this code path. When FD is closing, IOCTLs presumably
> can't be modifying the xarray.
>
> v2: Update commit text
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f04b11e45c2d..4cca16f2d4ed 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -96,12 +96,11 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	struct xe_exec_queue *q;
>   	unsigned long idx;
>   
> -	mutex_lock(&xef->exec_queue.lock);
> +	/* No locking needed here */
>   	xa_for_each(&xef->exec_queue.xa, idx, q) {
>   		xe_exec_queue_kill(q);
>   		xe_exec_queue_put(q);
>   	}
> -	mutex_unlock(&xef->exec_queue.lock);
>   	xa_destroy(&xef->exec_queue.xa);
>   	mutex_destroy(&xef->exec_queue.lock);
>   	mutex_lock(&xef->vm.lock);
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
