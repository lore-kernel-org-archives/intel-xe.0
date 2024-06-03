Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D2C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 18:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AAD10E174;
	Mon,  3 Jun 2024 18:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHR3P8Dc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335D10E174
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717441016; x=1748977016;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LuFyxMpWTHeF6KkL2wDivoFxdtawWFEuMy1nvz1xyXc=;
 b=LHR3P8DcZqIKh3aJqHztUeeDqhTIKRl0HYK2ceapcxjubfJnDy/1SMEq
 DaZQb1GIYGo/gT30D+C7f0JtcaHMFUo28czhSTFXLM10j6qASD/Ubrtn5
 zGfjUKW7W//Snqt0V+Dwouo2uVg7DJRr60opi1gpYbVUN+gPAn9Asfp7s
 fwxiK3BqxKo8+Zt7c1ZggenRWJJlOEfO++98FzswhbSdmCPwi6vm2hHFa
 ulQWQnhktD0nHlqZFwzk4/NBO503gze6Mi5xunsTfjd5dU5LC0t6cUCHT
 onX8J+HhfDQumLQ+LPv0+j9h43IVtMdaXhnCtW3NKuBkv62wzJ1qA4PoB w==;
X-CSE-ConnectionGUID: Y2BD+e2tSsGVWil2GhZhPA==
X-CSE-MsgGUID: 8lFs5HKHR7iGOQ/h/mU2VQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14176594"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14176594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 11:56:55 -0700
X-CSE-ConnectionGUID: XI0kTqWDT1G9zYjO2VI+ow==
X-CSE-MsgGUID: pXNTtj/FTf6wIay1eNASbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36852141"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 11:56:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 11:56:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 11:56:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 11:56:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 11:56:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJKknJAr2XZVDHbeUfkznmNyUyMT/qBWlCNju22glixUYJRj85xJ5MYkhKhCYzq22xVkVYX5In9tJpgfLZEF3nqUnrh7ZWvcMvxtZ2a/4gdXp45xrgHPAvu8jK0aYVgEjD61LuWihj4xyTg8Iymxc2suev8EaHJlOmPS9zfCEGO50vHFARusXBWvSneqcRRYQjUfauHNfNIsqWS5/UlWwGCEI6NKhX5m27IFFo2aIVBwJxlQA0P4CL0WGcEPFuyitc0bG6zNek4nfOseOOIMEJ7pwzaUUKtO60IulE0PEQMnkBXmcFx7EBWkRaxGf7EmgXwnCWVCNWdN7aEWMZyAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sjm8pgo7D4N8jeewRA/app+h2gciF3DJHopj+Al1DR4=;
 b=EvpdFFclS3vffKCcKe5OaQPUTu1nf+aZoCTJkUKKCtuR4WKRgyQ4ALt4VioaptlLDwll6C1Vg7pDUBzXVsIB6AG8tJyD5bcnFxoPoNLe4qYTAH0Lv8frpjTTEJ79s7DbYuaJwDHrd0m6vCCcf14ot+uoP94VDZWO1w9qprzY4vrbUKlnnKG1GnaB+uoj+v9wui0xwWElJAP+U6iLIfBGZ2CJjsKOgDPwFXdrW1WvNcMXuIjhQaVwSSF4QEHPaFx2w4rv6Zjg22BKVN3FdJlmGRNeExF4KZnfwrp9SrLgRwPIkNVuWwfb3xjF+I2mNMDajqyG8xO6/XjoDWFTxhVVtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL1PR11MB6001.namprd11.prod.outlook.com (2603:10b6:208:385::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 18:56:51 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 18:56:47 +0000
Message-ID: <92e54e93-dbb8-4dd8-8257-58dd8c87ff7c@intel.com>
Date: Mon, 3 Jun 2024 11:56:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Always check force_wake_get return code
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240603113005.710746-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240603113005.710746-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL1PR11MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 572c035b-6bf0-4b18-c3e3-08dc83feeb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTJXZENYOWJzTGNMQm9CbGxnNGJMRldlK3c5M0xmOWJzeTNjbTRZNTlobkJ0?=
 =?utf-8?B?QkRiSWwrRzM1R2hhOXNPRzlkYzB0ZHh5TmZVNW9JSHo0UWZDZVNXMWUzMTEz?=
 =?utf-8?B?aVp4UXVST0tqcW5DUWtRVXFUeVFTT2o0ektBVXM5NDFRTG5ULzVYdzJ5MTAw?=
 =?utf-8?B?WGpvZ3p1YUxnQ1hKUU1Wd01xeFNFMjlCR0FrSWYrTkpEekN3ak9pWkJvbWtI?=
 =?utf-8?B?eEpFSENpQmVmaHh6Mm5MN0dqMzZLZC9kODE2SURSd014b2J5bUZCR3ZCaGRO?=
 =?utf-8?B?RkpwL3pxV3Vnd3dFd3BhRkV0Y1UrbXFjRU9QS2E5aUtKZWJDUlA4dDRVWWJu?=
 =?utf-8?B?NExmZDBKVS91M3ErOEdZYk4rS0FXUFR5NmRIQjFsV1ZrVWhsWWpENEpJdHUr?=
 =?utf-8?B?MEk0bzgxN0RiZlFWU3kxcWF1bFlObVdMOWZLK3g1cmtJVEh0emE4MHJpUnUy?=
 =?utf-8?B?RWdZdHFjNjNjanZ5eUl1OTNKam9IcVB6QVd2N2VUbEZFUFJ5eksrRUZkMmpu?=
 =?utf-8?B?NUxRY0dqN1EvWTJjZXU2Ui9BL0hFb2hFaW5PYWs5T0g2bGhnUUtmQ1Z6V1BL?=
 =?utf-8?B?dVo2b2NOSk8rcWlXNGNLKzZtcC9vdjIrV0NMaGNsWWZXaS9qZ01Ga0NrVGd4?=
 =?utf-8?B?RnRRRTlQWldzb2NGYTNhZWpHVUEzbUxBREtKRWdNTHhramhMdW1NN2dCZ25D?=
 =?utf-8?B?c0FJeFc2NDNsRWNHaGxNc0hMeS9vN3FRc3Z0OFlHS3FZMlZWM2VTNFVJUjRT?=
 =?utf-8?B?dk9teWVSYitLOXF6U1hZVjVyeXV5UldjR2tYV2ZVa21BZUR3UXBjeXpPdU8w?=
 =?utf-8?B?R29hZFQ0aE4wNWFiM2FlWTU3SkFlamV3eG9WTHBKQWNvL0pMcXJUZGR3NVFi?=
 =?utf-8?B?b1RTSk1lUTZVT2MvZnA5SWxDQU4wZEtvbyttODUvZ3d3bFBFd0pBUFAvTlc2?=
 =?utf-8?B?K2VKZGZaTmxnT0NCK1pQQWZRN1Q0Z1NoM093N1lHNkxETDY2Y05VTjhTTDhk?=
 =?utf-8?B?Sk5qSVoxMUF6aUxOb0dUdGlGMzg2c0xWZzAwMmU2ZnJ6VEZuNHFaZEd5c1N0?=
 =?utf-8?B?aGRUWmdGeU0zaEhMbGVWYVU0MlhoTU1nSTJxMWpQS0VOYmJXVUovajFTNXgz?=
 =?utf-8?B?cXF4T0lsVW9ZRDJUb0s2UUoyTmVHLzVhZ1pReTQwNHcxWkYzSldoaGZEWGtW?=
 =?utf-8?B?S3pLbklwUXdlemEvV0U2dW16Und5elVoeTdic3h2YTV0QVl5RU1qTWh5QzRj?=
 =?utf-8?B?NUIwcFFtenBucVZweU9DUTlvaGNvaHp2SUh0UkFEelFlODJoaHI2d3N2UjVk?=
 =?utf-8?B?dEhKQ2dJQmE0ZDZqQlUvVWtrckhGbTFZRFZ6ZWZYQ1h5b3hwNVZiV2pUQ05w?=
 =?utf-8?B?OHljR0NBdVg0UXlmM3FKWU5CVFdLeTJrZUlzQ0g4Q09zZFc1MGdJY2p6QnB0?=
 =?utf-8?B?cTRMNHcwMnk0OEVKVzR4QitJZndrZXBuMWMySkJNQnFKYk1CSkJ4S01rTUYr?=
 =?utf-8?B?QTRPWVZFclFOMlBQTkVUd0R2aVJUZ1REazloVjd5VGluY05mN2szbHExbEJG?=
 =?utf-8?B?Z0ZYNXloUkQvdHkxMzZKSVdsNlFMaTJWT21sd3ZncHdIRDJNV2hLK2NHNkd5?=
 =?utf-8?B?Q1haSlhDZnlrcGlPNVAxVFdGQzFtWVk3aTNBNWV1Nmk3R3NGSjZTZW5JOHpV?=
 =?utf-8?B?R2VWMjJsNDBtY2JNclhEeUxlOXRjdWd5Y0NKRjAwbDBQemc2U2RSQzlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJrZnEwRWNWNjRmQ05oY0txWUU4UnZnZ3NwaU84RUg4dWgxZ2RwS2hRRSsy?=
 =?utf-8?B?dHdwR3NBeFRDb0ZXeDh6eWozUGE3MkhYZEkzN2pkd284Q29KVjIzZWdZM3BY?=
 =?utf-8?B?YWs4dC8wYU9DdDN4TjVhT25pS2N5NjllQ1VFMEZ5aWJMUHpkVUxTQXdHelJF?=
 =?utf-8?B?TjRia2xsQXRjRVljcHhHTE9MMU45ZitjR0RoalVBMzV1OU5UeUZQbko5YkYv?=
 =?utf-8?B?UTRwVzNNc0VqbnhON09KSzFvZ2VMa29rbGE5eHU0c2gvZHd3RjdITk0rdURL?=
 =?utf-8?B?VG43Z2YyY1FySEdOYk41NWZrS2YwVFNyeksxbVR2akMrR2U3U2JGbXUxS2NV?=
 =?utf-8?B?cXVkamFHWnMxeThYM3VqRHJDNDRndHNZaGI1WEFwbnpuTmpQcGY3UzU1ZmNu?=
 =?utf-8?B?MW1IN092OHRJdDdYSUEzU0cvaHpqK2E0dlB2TCtOME5HRVNoWTVyam4vOVpx?=
 =?utf-8?B?eXg4QzVhK2dnWlQ3TWROdGtBYmtHNG56NUd1NnZkZ1RnN2FXaDdRWmxZUEpP?=
 =?utf-8?B?N1lGNjQySnBaT21hTkpWZUZtNVRyZ2tJcExmb0lFMlJldE5vVDJMdnM1cTc0?=
 =?utf-8?B?R1JmK2l6OWZHMTJscjMxZUk4dnBpdFIwUmozUmpCdDU5ZHJMWm01SlhHMkpv?=
 =?utf-8?B?ZGYxU05XNWU1YWxRRSt2YXRNS1NXQVNaKzBxTWZjK0tZRk01OVM0Q0ZQci9L?=
 =?utf-8?B?Y0ZiSkNIRGlsUDRqbjc1M2pnQjVPVU8rUnZ2UnZ4RXlqQklHSHA4enU3cENo?=
 =?utf-8?B?L3ZmcXdidmtKblZ2WjgwRjNQemFsNm5ROWtvL0xIWVhWYjJ3cXRaSG9RUkk1?=
 =?utf-8?B?QlFZanJjcnhKd1BmVjZxTkl6dEYxWlV2WURUNFpoNmZOTXc4U0lFNGVJdDFy?=
 =?utf-8?B?VmdGRXRuamRTUElFNStiY29DdFo2ZFFjVFVKc1ljNi9XQXZ0V0JLWnM3UmFy?=
 =?utf-8?B?amlaMi9ZUHBxTDZzSTVMOFBnbFVjWlM4Si9VR1JQbnQ2eTVFblRNajJvNmlz?=
 =?utf-8?B?OXpPdjlZRVpKdStGWVU4ZmRKVTBoVjg1WHFaUkNmRDlpMmQ3Ly82cy9ycGhQ?=
 =?utf-8?B?djFnT2lJNVJ5Sk5FdExRaWlDVEFFVXk2MHAvZXZSQVk1eXdkMThjbjVwNEM1?=
 =?utf-8?B?a3ZJTER2MFNzVDNlYlV4NENneHdPdVcxak5ZdmpOUjVOZ0NwdUtXU1dOeVhI?=
 =?utf-8?B?WldXVWFXZDVReWpVd0gzYU1IN2JOL0Q3VGRRM0Y1SzlaeEZEMytUL3VzdXdH?=
 =?utf-8?B?OWxKeHcvbWRFemZrWmhrVkNBc1dFSFVtT240dHdtdDhCOGpFaDdYN3VDZ3hC?=
 =?utf-8?B?ZXg0Y1BvZ2ltMGRRRTN4VjhYdGZjMDI3bFRIRmtoUDBkUVozQjVLSFdTcm1W?=
 =?utf-8?B?NCt1c0xwU05TQlJHRXVkUm1jTmo3QW9hdm5YUmJSTFduQ1oyT1Z3U2NqZSta?=
 =?utf-8?B?cXlhZzV4K0lsdEQyVXE1S3JOcDNHaGtnT0dXUUsvOTc4R3RZZ0d2VkNGdFpS?=
 =?utf-8?B?UlBNTk8zV00xQW1WYWdZaHpicG83NGZkUDc3NW1peGtZbXIwZ3pVa2hORUMy?=
 =?utf-8?B?NVhMQWwzUWZZdWlKdnNDaXQ3UlNoUkNFWTJvc1VCd2tqc05WRmJVT25JbHMy?=
 =?utf-8?B?OHdFRFFxZGhKSUwzN2dIaWQ2RE0ySTk3OFk2c0EyeDIweU1vSFZIdTc0dkQ0?=
 =?utf-8?B?OTJKczVHY2NmTEpwWlQxRG53VUxmS2hRS0FsSFZ0T2liRnVEQ1VJSWNWQ3o3?=
 =?utf-8?B?UG5ScjlIdWFmVzNGRlhpVE1NNUlONTFXZnMzdVVEZFE2UlR1aXRIY2pLZWFS?=
 =?utf-8?B?ZWJVY2R4Zkh1U2RUb2VtcHJ2ZnNjcEhJL285TFJDQm9vM0pyaWp3T3ZSWE1s?=
 =?utf-8?B?MStVY1k5ckplNllvT01aVCt4UGVONUx6bW9aR2FmV2dIc0hBdGgvVWxyQ1My?=
 =?utf-8?B?NVpra01WeGNPS0tjV2tXdTVHMlNiWjBBY2tDa0haNmpEOTc0U2hEU0FBM1hx?=
 =?utf-8?B?SDFUd0VDVEhHcTIyN3RCeTl3UFV5N2haZ3NRK3BKWFFMbGhuL0dqZFoxbHZj?=
 =?utf-8?B?OS9HbU9qWmJBTDhsQm5JTmJ5VHJITFUycjJ1QVNkckNhaC9TNXpzV2xwcjFV?=
 =?utf-8?B?bmRYNXByZ1ZKblROSisyKytNRTlHSWszUmdKQVJ5Y2luSVdKRURBYkx5aWdh?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572c035b-6bf0-4b18-c3e3-08dc83feeb88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 18:56:47.7880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBHJ9/6o0WFoLoL3VqgB+HrHctwp+UjQSlXJy5X7h5hbUEPsXl6hlMcnybm7q1AdwqtC6UZyua1rrWgcL1MRUyL143ukNBIvBT6/F/dv7ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6001
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

The commit title seems a bit too generic, given that you're only fixing 
a single occurrence. maybe switch to something like "check 
force_wake_get return code in show_run_ticks" ?

On 6/3/2024 4:30 AM, Tejas Upadhyay wrote:
> A force_wake_get failure means that the HW might not be awake for the
> access we're doing; this can lead to an immediate error or it can be a
> more subtle problem.
>
> In this case, user has asked information and in case of forcewake
> failure, it might lead to wrong information, so return in case of
> error.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_drm_client.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 4a19b771e3a0..e050fc6d8dd7 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -264,7 +264,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>   		if (!hwe)
>   			continue;
>   
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
> +			return;

Since we're not returning any error code, there doesn't seem to be a 
direct way to know that a forcewake error happened; we can probably 
infer it by the lack of messages being printed, but there is another 
(unlikely) exit point that causes no prints to occur. Should we print an 
error to dmesg, just to be safe?

Daniele

>   		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>   		break;

