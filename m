Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20FCC02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 09:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2A010E5A8;
	Wed, 15 Jan 2025 09:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQkm6lRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B172310E5A5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736934378; x=1768470378;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sEYVZEsjDgLlOMSG3mrC4zQuZRad6L7rr7QRT0av71s=;
 b=gQkm6lRrtxRrPJNEvC7dmcYaqaBw1BqSjOGY25xM3OP20rNkJIV0W8SW
 zu/S3s6oJgxrerWRaYnhuTSSdHy/m4Il/gDk8DRvMtQqdDVH5lQVt6hhG
 MUgC/g7p19MSnuRBQnG/EG04p7k14mBrUPRXPfBNpMoFfJVNjcrEga2S8
 iHqDqIz7ioRMS0l9FL3z4jE3yX7B6J7dnnmiUo/lQPOKYO1mU++w8w7SY
 8KlBwaGWiZLYnQwN6Zq1CsKmKhn8cwj3JvyAA7yygorVUEtiFpZHzRxHO
 B+A3leLb+XErU4dWm4NU0TFuyBSQYfMskHslbBw4ef/6IUjqUE7uInp0y Q==;
X-CSE-ConnectionGUID: 1h9CYuCVReu0v/8vhFRjZA==
X-CSE-MsgGUID: vI0McfxjTZap5BCJxH4+Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37419261"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="37419261"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 01:46:17 -0800
X-CSE-ConnectionGUID: BxvYoQ0PQsSLvzAV78yg1g==
X-CSE-MsgGUID: qMk4TDA0RZ6ULk3MDAPxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135942035"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 01:46:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 01:46:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 01:46:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 01:46:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTA9jpWt1XMgCcCauSfl/67abP7SzGALGjPEGEDLZRyJblvO4sVZ2RjtE+zbOzMiBYS26CgX9294jxg74bwxstDWgzNsxLvTN/BAq4HQPtEZlSOSc1YKtx0BQqRGVPJPDhdJ1MGXTyh7Rn3e7k/0z635er4Yhj0e+9Ab/Q1g5NDzrOGHJXlp7hziZ4F//OJexIoYOpLuLnZB+CsRvx2vk8a2zR1/KufIdRRTeJe42Y9+v5ivz3pXm4kG85RaDjIhPLovuM9OgIRNG6ubQWh2maitaGBdHjVmLLxrNfq2Icet6nzQ7GCUSq8UNHghccuIutjxSkJJd7NFiGr0qdkoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfPuGwyCIaDBQ20XymeN0Py888nuNFvTIkYU0eWSBNc=;
 b=X6GzTm7zBLIVuCr7+ER5LDjJsCuvmLRzyvVF8Tuxt6+YPGU9K84zXa5vgE6R6SuwcerwjJ+qcubxN+EpnJ681+NF61YntohLrZmQI7rrLZzJDO8HY5SCjR9/AXkSE/wBdoaYEqyvmV+F6Y9mE2JbtAcF2LTFIp3B8zYnSN1FLodjb2TpZAO0xAYzgY2CWXqkJE25CU+jeGFRp7s3mMc/5sk0BD0fEz7Q6Z1qclooz9AjhccNs9xiHB+qH+cA1dFCk0AJBJs507XvORg98aVnJ9JEyegOZfsfp/Y6emAFsg28T6qyu7KX4CSeM0m6ioRsVVtOnfjC8zE+QmOg8voNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 09:46:14 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%6]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 09:46:14 +0000
Message-ID: <55e647fd-08b0-4395-8fb0-ad53ac3f9be7@intel.com>
Date: Wed, 15 Jan 2025 11:46:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove unused "mmio_ext" code
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Koby Elbaz <kelbaz@habana.ai>
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20250106234312.2986065-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e0c2cb-a524-4bbb-c054-08dd35497397
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGgyRkIzVjl2QXZHMWw2MnYwQ2U0MWx4M2YrR1VSY014b3daVWVTaTRqWkg3?=
 =?utf-8?B?V00wbUZhTGkwcVBRNjhaRzBhRjJMMVlId0w4RkdpUUtsT01jTjUxTG4vMmlp?=
 =?utf-8?B?OEtna1ZzZ2FMS244UTFzN1AxZzJRcm42YURTQ1UyYUJac1dVRWtKN01iSFlr?=
 =?utf-8?B?YTIyRHlJTFVKdlpCelVvV3QyZ0dubnh4WkgwRTZjNjVMYStrRkExYk00dXlm?=
 =?utf-8?B?VHNUcEtFV1FIOUZvVFdMTFUzc2JmK3lQNFRPcWJSVExIQVhRZ3A3UUpXajFn?=
 =?utf-8?B?aGtKOXZSYlV5UGhJN1ZPUHYyRlk3M1NDcis0U1UvakI4U0JUM2lLMFVZalVl?=
 =?utf-8?B?djcxbTFMWXhMbzByZkh2K1EyYithbWFjR3lzSDVzUVBUdE9WK2ZjWlY2SU54?=
 =?utf-8?B?cGVuZEdkWU9iVllSTHA0aitjUHJzUHhkaHU4SEhoUU1hU0JIYllCV0FSbGVm?=
 =?utf-8?B?RnRtOUhhNFROQ1JmV25YYlgwZE56OHU4MUVtQW1sL3VWRUpWY0FJdmViNTdx?=
 =?utf-8?B?R3pmQnRkQVFINlJOTTcxUThoanpPV1d3ZmNGWUpuRHo3Y212UG51WUpaZHdW?=
 =?utf-8?B?d2g2N3NTUzBqSmFEalZUdUQzU2JYQzRCUkR3Yk00ZkJuV1hPekRlVGx5L2FT?=
 =?utf-8?B?OEN0OHVQbU1QZS9ybHdHTkVlYmtoZGY2aTJsSGZ1T1JxWE1hczhPTnZhbHNM?=
 =?utf-8?B?UVpLdVdrM2w5UEt3Z1R0cG1mOXdtb3paNmNIQVZUNTFmdlFFK1pNRXhpRkFh?=
 =?utf-8?B?V1prdHdjc085RVhGbU96ZERHRlNRZmZ1QWR1RkZRcUJHVWlKakt6cW5aS045?=
 =?utf-8?B?Y25OOHlSTTV1Q0M4RElRUXgzUCthMlVLeDhpdFFKZVQwT1YwUkNjM1ZzbWd1?=
 =?utf-8?B?ellLeEw1bXp3eVFlby9iRzV0UkIxSUJtUmYvV0I0cE1ibHprZ09PSVViR2VS?=
 =?utf-8?B?VmtxQjJYSmFZanZpZUVNek9qOStieG82WEprSkNFYkF2K2NjYXBIWTh1cU5Z?=
 =?utf-8?B?dmNna2o3bExrWWE4VzF4TE9Wb0NnUUNMbVJ0YUxuNEIzSWd2TURwVm9KdnN5?=
 =?utf-8?B?YmlHZnhzdnRkWEpuVkh1K3B2QmZaUVhkZTZDbWlSMTBrazMwbk1jQW5sYzFl?=
 =?utf-8?B?MUZDM3BCVXlrMDZwTjVVQVgzSFo5bllmcCtIU1ZJV04rUzRkZENja1N1a2lB?=
 =?utf-8?B?KzF0WkQ2ODA3cWVpa1k0K0VvVzlVNGh3T3BkR2lvZzdSVGE2TEwzbEk1eUtm?=
 =?utf-8?B?emZqempDY3J6Z2poWEpzcnBRcm1xWG9jR0pMTHJEWUF1b01tVmxHd0JsNjdz?=
 =?utf-8?B?VFFyb0JEdWdXU0dXSTM0OHM0Z0h2UDNSNTIwb0ZmOTArZzAweHdRR0VzU0VI?=
 =?utf-8?B?bzMvQktZb1B4S2MzOWplYmdqZ2tnRWtmRU5lelBqSUZTTVZoYjQvZUNzWVNo?=
 =?utf-8?B?Sms0aHNFbkpURnpGSEJuZmR2Lzh2T1plbzFrOWVONlNWYWZlSlJ4WG1lTlc4?=
 =?utf-8?B?TG5CUlhVVEZib3k2bk5pVE1LelRrNVdiM3dFbC9GUUpNRDFacXJDK0c4cnEv?=
 =?utf-8?B?WDl5cCtpZmJEV1dJejduSG1aWkNnTzhFZzFsWWlLY3BFS1Bva1c4a2RGUCtZ?=
 =?utf-8?B?cmtlOSs1bFQ5ejVYRnozRzY1aTlwcThnNjVidmZXdDArQWpRQmx6M3BzSWZU?=
 =?utf-8?B?eUFUU2V0ZjhiWkJBZ3hvL2hBUE52am9tbkxBQmJzbW9pTjY1bzl0ZlhHSnBO?=
 =?utf-8?B?S1UzY2VXT0NZSnI2Z0VLcjh4MkYrVU1wOUlWblFGM2IzWnhPM1RTOEgybkxp?=
 =?utf-8?B?eE1SNEF0L3Jndll4MDVhWlRYU3FyNDRNREN6M1Z5MFdZRzllRzkwOVlMVXJy?=
 =?utf-8?Q?TE9N259rdn1WU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE5hYjJyZCszNDRqSWJlWDZ1L0xrVitpT1ozcmhLSG9aZ291NkpFNm45R1do?=
 =?utf-8?B?dTZ4UVJSeHAyeUxXMWJRVzRiNzJjQnk0akFFeXlaeFp1Rmx6MEhqbDA3TThR?=
 =?utf-8?B?NDNpdFhMeGRCMk55bXNyMkU0azNkWXJrL0F1ZFZDcE5tbW5JV3pXN3o2dHNQ?=
 =?utf-8?B?eWhyQml1OFB0dHdHYTFzZW5VKzNVbXRPSGRybnV6QWVHbmdGVk5EY1E0K0RZ?=
 =?utf-8?B?a0FNY2Z4TFg1K3JkZG1zSzVpUjlLWExONkp6VGo4eEZiaHVnSjNXWHM5cWhk?=
 =?utf-8?B?YWlpQWFzYTltN0lndVlKRHBIY2d0OXY0OURYUGlkRDJvU0E0SG9DRDZGL0tT?=
 =?utf-8?B?cS9rSG5kR0wxQUZhejI4UFZaYWxKTWxuYklNTjFjbWN5aTF2T3hhRjlKSUcy?=
 =?utf-8?B?VmhiQk5BUlpaUi8xVnlJbjI5YnUrSXJxOTAzcEMrUmVkWkZ6QktXeTBVQkwx?=
 =?utf-8?B?eGNkcWhvYlQva2RkKytNUTJFSFZDaXBhR1hEZktxUzZ4a2FCVGNSRmFPd1hI?=
 =?utf-8?B?R3NETFAzUEMyWFBwRk9qUWFFanhNeldUZzFjQXNOYkZuRGhxZ2FDcEpENEFr?=
 =?utf-8?B?dXF4bXdqS3o5NnJ1RC9yaStETDhUNkExMjNMOXRwcVRXNnY3dkRrWWcva2Rp?=
 =?utf-8?B?M1RnQmNkZlFpUm9BdzFjQkt5RWJ6TUJlTWpxNEFaRjVZdDFsK3R6QW4wd1R0?=
 =?utf-8?B?QnNxNWJlS0tBWnFuOHpGR0kvWFQyMFdQbzhmWGZHa2lXaXR1TGtkdGlXOE42?=
 =?utf-8?B?NXNCWjlNeU1SMm5RNkIzZFYxUzl1ODk3c0lmenhHUW5jTjFjcm81NTVRUytK?=
 =?utf-8?B?aU1OSzBkenBWY2IxdkNHbnRyMDFocFJtTUZ4ZGJ4ZGFDWGFIOFpxRTluZjNh?=
 =?utf-8?B?WmdVZ1NLRlFqZFF1dSszQmtBTUV6WXVBWGR3SFpRaDdyblQxUitTZkY5YzhD?=
 =?utf-8?B?OWtOM0RIVGczY3d3a2cyamFxRG1RamUwVG1TRTZpL0ZIZGZuVTljUkFaamg4?=
 =?utf-8?B?TVJ5K1lYM0c4NDczVGtYZEtmdkJRSmoxWGpVWWVGWS8vdWhCcnRvZUd6Z25K?=
 =?utf-8?B?anVsN1BUa1pWUkFQbjNFdHBkVjJBUXVHS2g1eWpaeUo4ejhQdWJnamFtZ0po?=
 =?utf-8?B?bCtkMlFkbk5QTGUrQ0ZXQTBIS3UzY1NXVUg5WVVqc3hSdlovNXdnWWU1S2Q3?=
 =?utf-8?B?eFJCTEJhOGd6Skg2K0ZtNzZxWXZqV1B6MU1KL1R3V21NdEhVV1kxTkFQR1g0?=
 =?utf-8?B?aHFFVlMxNTdEaWhPTnJDaHo0Y3JsVC9lOG1tV3JTc1p0VE82d2hnR3dQVWc2?=
 =?utf-8?B?M1JWaFp6czN5QlFabG5XTGtKMVlGMDBhMG5GMjJzbEdMaVRuRjl1V3VBQWVT?=
 =?utf-8?B?QmtSZ1E5aUE5R2VDMVpXSFU0TWs0SHZUcW5uNXRBU2NGVHNoVk9OeU1zd2tp?=
 =?utf-8?B?R1YwNmx2bHdETGhURjdnNnNHbG8zVVUxTWJmSnBtSEpUQUdPVWRJeEVIdGJm?=
 =?utf-8?B?M21MYmYxZUVQdXdzSXZTVDFPWDExVnVWSmw2WUEzT21Sc3NDUmZtRHpaWkVU?=
 =?utf-8?B?RnczQnRiT3B2RzNWMkNNaWVhQWpXMmpEUzFtQVdwZWtKNUxGa2c0NTV1SU5s?=
 =?utf-8?B?b1NXVStKRXhNdkwrc3E4dWhlV21wazRnUUt1dHN6L05ZMGtURDVNUnZYZy93?=
 =?utf-8?B?YnRVUitFK3YwS3NzNjhyUFhRVTZ0cjl6SUUvcnU4bjJ2ZmNOcENwWjdVV3hx?=
 =?utf-8?B?WWdMeXZrb0grS0VQZllzN3FMMXE3K0JtcHlnY2l6akZsNnN2bVdaVW5OWU9w?=
 =?utf-8?B?aVhQY1o0dlZ3dEhuUWp4OGhXbkxSMk9UOFdnQ3owSWNYdHV4SDhzMWp5Skk0?=
 =?utf-8?B?ZEw5ZnZHZ0RpQWt1a0Q4aTVYZSszZWtINmp2R0dWYUlBY0h2RW9BNStwYmRM?=
 =?utf-8?B?WXBqdnZ2Sm9ORThpbzFIOTBJdDM4dFpWTGdlRVJGVzBwRG5vTFRRYTkrNllG?=
 =?utf-8?B?YjQ4NTRSYnlJQVlZMEppdC9sSEIwai82ZlNvQ2kzUmU5NVZSR2tnclFmeTdB?=
 =?utf-8?B?QVh6THE1TFd2Yk1TVVFRaG9NTndkUWU3dGZ1aFpMK2pIcUpPWnVTWG14Wlhq?=
 =?utf-8?Q?vaHNcWDlQ3NSNILYfnNze9ZZn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e0c2cb-a524-4bbb-c054-08dd35497397
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 09:46:14.7111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbF/7F5FLJ0nuA2eg9BAdPPHYHDc78jo6u1FgLtKiYC5hd6znvaPgSa8FUwrxikELitWP4qg5nnHllvhzilRwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

On 07/01/2025 1:43, Matt Roper wrote:
> The "mmio_ext" and 'REG_EXT" code is currently unused on any existing
> platform.  Going forward, this also isn't the design we want to use for
> any future platforms/features either, so we should just go ahead and
> remove the dead code to avoid confusion.
>
> mmio_ext was originally added in an attempt to hack around the early
> (mis)design of the Xe driver, which used xe_gt as the target for all
> register MMIO access, even those completely unrelated to the GT subunit
> of the hardware.  With the introduction of commit 34953ee349dd ("drm/xe:
> Create dedicated xe_mmio structure") and its follow-up patches, that
> misdesign has been corrected and access to register MMIO regions
> specific to hardware units is now done through xe_mmio structures which
> encapsulate an iomap, region size, and some other metadata.
>
> Although all of the registers used by the driver today happen to fall
> within one specific PCI BAR region, and thus re-use a single device-wide
> iomap, there's no requirement that this stay true for future platforms
> or features.  I.e., if a future platform adds a new 'foo' hardware unit
> that exists at a different area in the BAR, or even in a completely
> different BAR, then that would be handled by doing a separate iomap of
> that unit's register region and wrapping it in its own 'struct xe_mmio
> foo_regs' structure.  The pointer to the new 'foo_regs' could be placed
> within the xe_device, xe_tile, xe_gt, etc., according to where the new
> hardware unit falls within the current hardware hierarchy.
So this approach suggests that each instance of struct xe_mmio should be
initialized with its own iomap() call? If so, I think there's more work
to be done here, something like:
1. get rid of xe->mmio
2. refactor mmio_multi_tile_setup (each tile has its own xe_mmio)

- Ilia
>
> This effectively reverts the following commits, although parts of these
> commits had already vanished or changed with the earlier xe_mmio
> refactor work:
>
>  - commit 399a13323f0d ("drm/xe: add 28-bit address support in struct
>    xe_reg")
>  - commit fdef72e02e20 ("drm/xe: add a flag to bypass multi-tile config
>    from MTCFG reg")
>  - commit 866b2b176434 ("drm/xe: add MMIO extension support flags")
>  - commit ef29b390c734 ("drm/xe: map MMIO BAR according to the num of
>    tiles in device desc")
>  - commit a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support
>    MMIO extension")
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Koby Elbaz <kelbaz@habana.ai>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +----------
>  drivers/gpu/drm/xe/xe_device_types.h  | 11 --------
>  drivers/gpu/drm/xe/xe_mmio.c          | 39 ---------------------------
>  drivers/gpu/drm/xe/xe_pci.c           |  3 ---
>  drivers/gpu/drm/xe/xe_pci_types.h     |  2 --
>  5 files changed, 1 insertion(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> index 51fd40ffafcb..0234d1e84139 100644
> --- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
> @@ -21,7 +21,7 @@ struct xe_reg {
>  	union {
>  		struct {
>  			/** @addr: address */
> -			u32 addr:28;
> +			u32 addr:22;
This will limit the xe_mmio read/write operations up to 8MiB offset across
all xe_mmio instances. It is enough for now, but we might want to leave it
as is for future platforms. Also, this means that setting regs_size in
xe_mmio struct to anything bigger is meaningless and probably a bug.
Maybe it's worth to add an initializer to xe_mmio struct that asserts this?

- Ilia
>  			/**
>  			 * @masked: register is "masked", with upper 16bits used
>  			 * to identify the bits that are updated on the lower
> @@ -41,10 +41,6 @@ struct xe_reg {
>  			 * @vf: register is accessible from the Virtual Function.
>  			 */
>  			u32 vf:1;
> -			/**
> -			 * @ext: access MMIO extension space for current register.
> -			 */
> -			u32 ext:1;
>  		};
>  		/** @raw: Raw value with both address and options */
>  		u32 raw;
> @@ -111,16 +107,6 @@ struct xe_reg_mcr {
>   */
>  #define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
>  
> -/**
> - * XE_REG_EXT - Create a struct xe_reg from extension offset and additional
> - * flags
> - * @r_: Register extension offset
> - * @...: Additional options like access mode. See struct xe_reg for available
> - *       options.
> - */
> -#define XE_REG_EXT(r_, ...)	\
> -	((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__, .ext = 1))
> -
>  /**
>   * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
>   * @r_: Register offset
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..16ebb2859877 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -186,13 +186,6 @@ struct xe_tile {
>  	 */
>  	struct xe_mmio mmio;
>  
> -	/**
> -	 * @mmio_ext: MMIO-extension info for a tile.
> -	 *
> -	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
> -	 */
> -	struct xe_mmio mmio_ext;
> -
>  	/** @mem: memory management info for tile */
>  	struct {
>  		/**
> @@ -263,8 +256,6 @@ struct xe_device {
>  		const char *graphics_name;
>  		/** @info.media_name: media IP name */
>  		const char *media_name;
> -		/** @info.tile_mmio_ext_size: size of MMIO extension space, per-tile */
> -		u32 tile_mmio_ext_size;
>  		/** @info.graphics_verx100: graphics IP version */
>  		u32 graphics_verx100;
>  		/** @info.media_verx100: media IP version */
> @@ -314,8 +305,6 @@ struct xe_device {
>  		u8 has_heci_gscfi:1;
>  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>  		u8 has_llc:1;
> -		/** @info.has_mmio_ext: Device has extra MMIO address range */
> -		u8 has_mmio_ext:1;
>  		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
>  		u8 has_range_tlb_invalidation:1;
>  		/** @info.has_sriov: Supports SR-IOV */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index a48f239cad1c..d321a21aacf0 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -103,50 +103,11 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>  	}
>  }
>  
> -/*
> - * On top of all the multi-tile MMIO space there can be a platform-dependent
> - * extension for each tile, resulting in a layout like below:
> - *
> - * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
> - * |         ....         |
> - * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
> - * | tile1->mmio_ext.regs |
> - * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
> - * | tile0->mmio_ext.regs |
> - * |======================| <- ext_base = tile_count * tile_mmio_size
> - * |                      |
> - * |       mmio.regs      |
> - * |                      |
> - * '----------------------' <- 0MB
> - *
> - * Set up the tile[]->mmio_ext pointers/sizes.
> - */
> -static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
> -				 size_t tile_mmio_ext_size)
> -{
> -	struct xe_tile *tile;
> -	void __iomem *regs;
> -	u8 id;
> -
> -	if (!xe->info.has_mmio_ext)
> -		return;
> -
> -	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
> -	for_each_tile(tile, xe, id) {
> -		tile->mmio_ext.regs_size = tile_mmio_ext_size;
> -		tile->mmio_ext.regs = regs;
> -		tile->mmio_ext.tile = tile;
> -		regs += tile_mmio_ext_size;
> -	}
> -}
> -
>  int xe_mmio_probe_tiles(struct xe_device *xe)
>  {
>  	size_t tile_mmio_size = SZ_16M;
> -	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>  
>  	mmio_multi_tile_setup(xe, tile_mmio_size);
> -	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7d146e3e8e21..90fcfafd362f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -61,7 +61,6 @@ struct xe_device_desc {
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
>  	u8 has_llc:1;
> -	u8 has_mmio_ext:1;
>  	u8 has_sriov:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
> @@ -622,7 +621,6 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>  	xe->info.has_llc = desc->has_llc;
> -	xe->info.has_mmio_ext = desc->has_mmio_ext;
>  	xe->info.has_sriov = desc->has_sriov;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
> @@ -682,7 +680,6 @@ static int xe_info_init(struct xe_device *xe,
>  
>  	xe->info.graphics_name = graphics_desc->name;
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
> -	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
>  
>  	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>  	xe->info.vram_flags = graphics_desc->vram_flags;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 79b0f80376a4..873efec5cdee 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -20,8 +20,6 @@ struct xe_graphics_desc {
>  
>  	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
>  
> -	u32 tile_mmio_ext_size; /* size of MMIO extension space, per-tile */
> -
>  	u8 max_remote_tiles:2;
>  
>  	u8 has_asid:1;


