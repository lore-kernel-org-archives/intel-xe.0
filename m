Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84223C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 00:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4E010E18C;
	Tue, 29 Jul 2025 00:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="noFkEGGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7618710E18C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 00:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753747690; x=1785283690;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ES88mzPy2/F4X1kC1VILwX0unCHHXv2XZIkl6MsDQEk=;
 b=noFkEGGPbW19mzZitHkvBNx89WTo8jYw5xh6d9UDtv87b4kH2NNujc65
 s/pin2Xteo74+iofnrKs/LJX9zJemLYR4LxyFRdqJYWeSQKvcPX7uB6qQ
 FtmmkPvvNbXONKyK9Np99q0Rtbf6zXRKo+iaxrTEPcIymSdidC7Im1/yT
 TODvdvyKBWMmWWG1fiFZF+/+BHwi5EpgNLq1A5xYUdWVkIGnTtCRtID/O
 SQkkjlRGXhvNxcVxNCHmxw37I4c0+dfTbk9Kbc9zjWElh3d3ljhVA+lGU
 C2ixWr+qxmkg2UPRSVwcyf+d5knWiosyzSUiej4ZCzoU2mki9W0KtEKo9 w==;
X-CSE-ConnectionGUID: i1Ex/c+YT4KqhHfxILbtsg==
X-CSE-MsgGUID: 3z6EqhniRiuT2hjy949qgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59809684"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="59809684"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 17:08:09 -0700
X-CSE-ConnectionGUID: +veXo0ggTlGuqEoSw9iOYA==
X-CSE-MsgGUID: jwy9Hbd/QLOTkCSbjyk86w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162876012"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 17:08:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 17:08:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 17:08:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 17:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irD/bDzObhAabKa/FQQO03MJLi7IUxQUfg6LGD1ltoEv8QYhDH5FuASP1el47QmoD2/6GQ+LALKtXrPHGW5F0cALqKZUdmFcu5mx0QeY1vVcF6T4qJQoz2XemnjSxz0HCWTl0Q8lp4toI8fE6YTM8LDBKFuNuqp6F6YD9TEd97fsq2dWeIaf5m43yuNZlj1lMfwv+i1246yT46nvdvDbZSr/za3BRKyg2rqcvrP3WLJUr6/VUn8VOJrCfYNzEUVGLWedfdpvOaBlnOZvETPCUZDl+lJjLuDQXTMFEoWO6RZw76NB4L5vN5pQQ9Kg5sAlq0rltfItf3rjU2ZJv7KDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSMV1gKCs7VHUjXiLej+sMOUpOpMZQ2VQe3ggCZ8jgw=;
 b=CTDWVEgBaZxbp2YCVuhd5Q1LLPYI5RxIZr+w/DbLFPUFhlsF1sSG5uuLY6kMJu3unbUgNutbvN49GYyYiLZGtML8F9sUfQKE9AF9jWcbmBqgBfLBopw25fOI/SiCFzTJg4UGTRotsggpsf3ayy+ve5meG26rfUBKvLekA8YOQlHhDfdwPyEwaedviAbzwEGjy8jIWleSImqMo0mUr0KEoZekxn/qF7CrsKCPFxe4uDN0/9+HchME8SME/Js/+2eMo0mYVeSeyERZ7SHg6MeBdmjqTueFmz9Mrn/BJX+QcqlNAWeMpkq2QJbxu2Z836JMWDLWiBh0czoCTnr6WQRQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 00:08:00 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 00:08:00 +0000
Message-ID: <93a0db14-148a-4ab0-9f9f-7e07dfd80d16@intel.com>
Date: Mon, 28 Jul 2025 17:07:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] drm/xe/configfs: Keep default device config
 settings together
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-9-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250727172009.587-9-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:303:8e::10) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 738c7d2d-0499-4018-da2b-08ddce33fac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkxEUEFBNUthSXBYbGgreU9zWnBLb0FRcXlVb0tJU1lzVWU4VU42NUxWdE9D?=
 =?utf-8?B?NVY2Z25lTnN0QWhHNjFTR2xLTkVUaWlTclhTbWRRcXhkN2kza1RNQmEwM1dO?=
 =?utf-8?B?VGNuOE9RL1U3eXJocENWamFacnVHWmNQMDBzazlYN3h1djlMY2JyYXhpc1Z0?=
 =?utf-8?B?MzJUM0RITDZmRUhrR0JwaEh6YUFRTnE2TTZ0dTFJbWRYTjVsS1N0YkowZldR?=
 =?utf-8?B?YStMMGhwMFI2cHpzVnVFeFNPcHpyYzN4aUIzUDA3VFF2ZnpGektTazZRbndJ?=
 =?utf-8?B?QVk1OUJlZjAyemYzZk5HYjBWeEN5cTRwYldwY0F4NUduYm56d2tTZ25zajVN?=
 =?utf-8?B?NTFHc3R5d0YyTVdLNkU4cnprOTNsalJrQVBMcWRGb2RER1lWU0pQS05XQVNM?=
 =?utf-8?B?TE5UNmFWNmhjb1NyRXdsdTBDQ0lRT3BjVHNiVUI3WW9UZkVOOGVXYTVqOHlr?=
 =?utf-8?B?M2xqY2NuZStKV2g0Y04vMTJPaFNDQ0lnWXhKaEoxdE9pODk0Witpb2Vwbno2?=
 =?utf-8?B?cW9rM0VVbDVvdHpVS1JnZVpUdWdYNVFsTEZOaHphZy9naVVCSXcyWnpReG5K?=
 =?utf-8?B?bHByODQ5QzVWSnJTci9FUHlNaytqZXc0d2VmUTBDQUJxTkptZFhpQ2VrY013?=
 =?utf-8?B?S3hHa1ZTNXhDRWxJYXkrNTNnd1p6Z1lSTUtDUDJVczJSM001eUsrOHFyYVNY?=
 =?utf-8?B?N0VSaGRVV1VRNVhHSFFlY0hpNGRFMm9wK0hGNXMwaHZQbGhWN2ZjN2ZubVh1?=
 =?utf-8?B?VHNYeDVpN3BLWkFTbDlXNjA1WGs1Y3hVRmptdzJoSDBFQ1E0clZFRlBZN1d5?=
 =?utf-8?B?cDNpUWFoTUV6MkJ1SWRBMzlVMk8xaUkrSEltVG4rcm9DZEJUcFRKV3ZXWG9D?=
 =?utf-8?B?bkVBRGk0ZXF5Q3NKdDNYQzJwVGdOQ2hsY1R5cUVETFVGMU1DVjg4Nzd2UFpx?=
 =?utf-8?B?eW5pNHVNUWRzekVFME90dWxnSGZycTJDK1RnaGY4NVNpdGpXcUF0N3VkVlR2?=
 =?utf-8?B?UTFMZy9kU3VKRXpTd1liN0VnS1psTmNQSzltVTV5NkY1QXYwWEVnbE14OVlw?=
 =?utf-8?B?K2NyNk9NY1QwZlhkRVZCTElPL0RxWENrWEhkeDNuYk1ScGxXSmx4NkVrQTg0?=
 =?utf-8?B?NGZXT1BKWkh2aU5WYm5vU1c1NC82d09IQkVLZXhrOWovOGhtek9lUmhXSmpJ?=
 =?utf-8?B?SjhKeUhuZjdvdm5hZVJrbkJxaTJUTVdMSlk1cVlqczRtNitxSjI2bzBQTXNJ?=
 =?utf-8?B?WVFQQnM4dmttREhtaXp3RlYvTWtjazhtOHV2R1lHblE5cTVhNFc2Y2VEeXYv?=
 =?utf-8?B?dHlSbG9NV0xqU3UvVjBtcEpxZFBUYzZHMW5xVzB5TmhSb1F1bWttc3ZpSmIz?=
 =?utf-8?B?cnVENW5NWkUrNERDTXY0RElWNC95Nk9yaXlKUERZNnFobFF5NXA3eW0xdU9r?=
 =?utf-8?B?eVZiclhGdkVYNVlOWTdFU1RpNHdUV2x4cjNqWGpiNGZwWHlzamJieFo0L2Zx?=
 =?utf-8?B?K0NTbGxvMnVMY3haVnRuMGxab3l5UzBUY3doWXgvWWRDS3NDWCthdTZGemJF?=
 =?utf-8?B?bk1CZ2w1S0h2QXBIaUlSV01DUUFWOTZCMUtOVUxqRjJ3ME1zRDZnZjhSdnp0?=
 =?utf-8?B?TlBWSGJJK0VoRnVTcm4vWE52U2RlbHZwdWR3TkQ5WG9XcFltdzVqdEIwSnU0?=
 =?utf-8?B?S2Z4RGFWT1hxVnZQMEFvVnQ2UitNWVE4aVZ5aTFidG5kSmphYTZpRVJEM0Uy?=
 =?utf-8?B?Vk9kekZWR0FiTlQvcDJNOHdhYUxmdnNlNGk1QVNEeE43a0xxUDhmN1REMGdr?=
 =?utf-8?B?M3kvaU9FQjNMUnBQbHp5NnVxWmtVeVJjaEk4ZVd0OWpzUlJPL0VKUWNIVnht?=
 =?utf-8?B?V0l2S2RKKzh0ZFBMeXJPTjZJd0ROVFM3MzJSREJySjc3YzFJOVRrMjcwdGNs?=
 =?utf-8?Q?VtblSKgCajA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTFHb1M1Rm8rLzhiUjhld1pkWFFDQ3EvWVFCSG5FNU5sazdkZ0N2dmNDdjly?=
 =?utf-8?B?VmdPZTExajg5bzF5a3hZZys2Q2VsenlRMTB3U0pvQUVFbEJDRkdyUEtmN1l6?=
 =?utf-8?B?N2R3T3gwNVRacmxLQTlpTkFtTVZaMGVvdy9Nak1LcDA1aW81b1pZYkxXODl4?=
 =?utf-8?B?Rnl1M3NhanJCQ1Foa0JiODZvTDVHS0swMEhnVEZSa3hCY2tMWlljRDh1SVN6?=
 =?utf-8?B?bUcwVVZLcWxNRjBWYWxzWjBvOTZlRGs3QmJ3ZzAxU1NLT3QxdFA3emF6OGxr?=
 =?utf-8?B?NHJKOE92M3JodStpMWFIOWhzWUNxbyt5eHZwVmk4R0srUlRFK2swYWNwWUdS?=
 =?utf-8?B?b25UUGdxUG50VGxiNkprdXJrMFRJQlhPQ3FpTDlIMnNVY3JqeC9Mb0VSeUU1?=
 =?utf-8?B?b1hxOFRWZXpra2VCMTVzS0JmdCt1Q3RpMFZTelcvUUwzYVZwL0g1VnVLNGF6?=
 =?utf-8?B?Y2M5NWJVMmpKL2puSVgxcXlYMXQrUU1vbUQrdFkzb1hBYTZiNC9jcCsveUE2?=
 =?utf-8?B?dEhBc25XL1Q1S0ZhcVdMc21RSm1NTVBrbXlXOUVlWUVPclRzTURZVVhLUFZh?=
 =?utf-8?B?d2hNUGEySlcrMy9KY2RnOTBVWWFSUDJwYXVKNXZCV3hEeFJoanRqK0htaWxm?=
 =?utf-8?B?VXVNdVdZZk83ZjAycmsrV2NsK25CQzBxYXViZGVjYS80QzBGOWczMy9VUkg0?=
 =?utf-8?B?aitGVjJxVXVmQVFESUFGYWFNSTA2cDFXdHRGRFo3U2RkK3JPd0NGTTRvNWVa?=
 =?utf-8?B?eURYOG5LaHRIMXpaMEpHSisveXVCelF5cmhzTGY2a2w5clJSY0hWbGRtWmRp?=
 =?utf-8?B?MG1vOU1qbkN3aGtGSVNQSkpRTWJWb0dzckRzOXpYWmhRZnFVUjVZRmFyRWY1?=
 =?utf-8?B?SlI0WFlpM3EwMEY0THRFY0xiQTJ1V0FpaFRDa2hlbVlDUWpKTER6U0V6ZHBu?=
 =?utf-8?B?T3NaZlBlN1B4eWtuRnZ5TkhNa2lSaHN3N3dnUS9yc2dYNnkwU012eWl3UkhT?=
 =?utf-8?B?WHVVTVF2Q1doRnlpS1FFM3QvMUx0Z2NkOVZtSENTK1MzcjRNRS9GWDZwckFP?=
 =?utf-8?B?UHBxZ2JXdUhRakFxbDNFQnhPczhzTlBoS1dMMjljbkFaekpkMmdxeWpmRTFu?=
 =?utf-8?B?c1hsK0ZGMmpPRDh6TWNJWStGZllXd0pYRFhEUUJtdngrWFRaNU5LVUpQMlBq?=
 =?utf-8?B?UXNQMzVzbUhEMjBmdHU5NWZMVGNzV2RuRElObkNRSE5Vck1Jc2tjR1YyWlFG?=
 =?utf-8?B?Tk9mTDhQZk13Ym9SaUpXSHhSa1UyTVRnL0NMTHZkYnBueFM0dTZNdFQzSSto?=
 =?utf-8?B?WlgxRUwra1h5dWVNbUZJRXNiemNza2M0VFROT01SYVRIWHhlaWVZaldhcEZM?=
 =?utf-8?B?V0l4OHA4Y3J6TS9semgzNlN2QklSdm1qanNEa3ROUnlPdUtWM2I3RUNCU0Z4?=
 =?utf-8?B?WHV4NnpPUWFnNUlRQU1VTmU3OHgyS05SUmxRRWxwMWZPbWtHS3o2TmVLM25i?=
 =?utf-8?B?bWQ0bFE3a1BLZWFZVUkvd05SYUYzQzdSWEh6Y2dJOGJiZyt6Mmc4MmxGNGI3?=
 =?utf-8?B?WTZLTHhySTZWbjBmRXNFTkRwOGk2a3NJNTFmelJiMmVmelNxTTE2aXdwS2tz?=
 =?utf-8?B?RVlZdVpmQ1p4STk3ZU1jcjJ2Q01Ca0tQa1cvbWd3TU1vR3NES0pvTVo1NGVJ?=
 =?utf-8?B?UXZjTC9LUC9tQ2JNOWpmdjVpQ2xITVhleVVvWkIreDJiaklSZmJ2ZWR2cndT?=
 =?utf-8?B?VWJ5YkJIeTFiNjkrcTdkNnJicGFWKzVpWStzOVg1dUJoZGFRT0t1NmJLSmUr?=
 =?utf-8?B?WXRURXhCMllSeUN3dklwVnRBOGc4cTEzWEh3blBINkg1MmV2dEFsM2RIZ2Rt?=
 =?utf-8?B?N1ZQS0xyMjZNTExyQWFYM01aN2cxRzhTMW1SYU5xWnEzVlhLaHc1SU1hcnFw?=
 =?utf-8?B?RW9LTGJoWWYzcGdMU0dqaG96eGFCWkNVbUVHSGJZdHU3cEJINC9mUzJMZXNT?=
 =?utf-8?B?SHFmNWZURXZlQy8zT3lrTTdMY3FGeFhXZnFCK1NjZEk5OWR3UjVsY1BBSENk?=
 =?utf-8?B?OEMyYm9pbWhCTGw4UmtlN29YcXNJK25TOWpHQlFxaEFMeTI2a2gzMGpQT2hF?=
 =?utf-8?B?ZnNmbWE1aE5nTkZVNkFSUkZaZEU5eUpGeENlYkNLZDdwTXVjSUZwK3hnd09P?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 738c7d2d-0499-4018-da2b-08ddce33fac0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 00:08:00.3694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImcI1iEUsFIaPmOglf/WTfxmNWcwy3bIFtK+3QdD7RHqL7CEwqMBXo0vt1xuLGAZ0/NHvjoD6q8Y71tCav6Qmx+a3yMNhd95GvFV6b1ESII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
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

On 7/27/2025 10:20 AM, Michal Wajdeczko wrote:
> For easier maintenance add a placeholder where we can keep all
> default device configuration settings in one place.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index a5f13dd779c7..60d89d3ef656 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -98,6 +98,16 @@ struct xe_config_group_device {
>   	} config;
>   };
>   
> +static struct xe_config_device device_defaults = {
> +	.survivability_mode = false,
> +	.engines_allowed = U64_MAX,
> +};
> +
> +static void set_device_defaults(struct xe_config_device *config)
> +{
> +	*config = device_defaults;
> +}
> +
>   struct engine_info {
>   	const char *cls;
>   	u64 mask;
> @@ -286,8 +296,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>   	if (!dev)
>   		return ERR_PTR(-ENOMEM);
>   
> -	/* Default values */
> -	dev->config.engines_allowed = U64_MAX;
> +	set_device_defaults(&dev->config);
>   
>   	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>   
> @@ -339,7 +348,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   	bool mode;
>   
>   	if (!dev)
> -		return false;
> +		return device_defaults.survivability_mode;
>   
>   	mode = dev->config.survivability_mode;
>   	config_group_put(&dev->group);
> @@ -382,7 +391,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>   	u64 engines_allowed;
>   
>   	if (!dev)
> -		return U64_MAX;
> +		return device_defaults.engines_allowed;
>   
>   	engines_allowed = dev->config.engines_allowed;
>   	config_group_put(&dev->group);

