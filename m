Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7638DCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373A310E18C;
	Tue,  7 Oct 2025 13:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9dvFZ9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295A710E18C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842229; x=1791378229;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n/uYb4v/qQWC+QDT9Z7sjtngBsASx/OqeagK7bWnTOk=;
 b=G9dvFZ9mXLx4tMjA6W2fN0Nk95Q7IzrLxjDNKKPo92m+Q9LBQr2hJE/F
 SzFcuOShnz4+2zDpWda6egEeiinp2ztYGYN7xStkNwyNPW3ZgaqUYg//O
 hRPH5bjAmnnr/snybW5vHl3ekZKe07nbXMSH3TBvs2qqcCUoJNlzskKSY
 AkwxuapI1watAio0itPjbswY6yKQbyyeKRTdPaYJH5MEo8lIPqBpHsoIt
 td4kgevD33lv6Y9QxcdAS5WJC8pbJCC1XzCRbuyY2XRM/iashP17q2rP9
 9WcCBkJzocY3KaHfKG/b/VXuPjPKeAYoVN99Lgq4MI14TeLAmPVcBFw1S A==;
X-CSE-ConnectionGUID: qqBny/dpTjap6Oin5WbTUg==
X-CSE-MsgGUID: COoVFLdfRMqjkVkF8s6yzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639670"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639670"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:03:49 -0700
X-CSE-ConnectionGUID: MCO5NOS6T/aSGoyKdqgngA==
X-CSE-MsgGUID: OlaPm2quSayy+6yo6iFWcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:03:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:03:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 06:03:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 06:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxDQKNG63Tdj1Q76oTaPjAZfmEgSZQQpomQGgvvQPcaOx7TAAgFl7I9o781QqznjCtZuuOAG/qo8aot61E97JTEbR1WwTtNSaOnxYY4FLzyNB7ncrltIrG31D0bisEkpFUSd8AsK1VcLQ9aWsUPHWYV1I6yLORVloUPYu0BC4kPY9RcjYA5sm9L6EooVLT7JyfvFzKXzjZH/7fgvdTBO9GsAXIGcurWl1jnVFW/xarBb6KGSW/fI6pST7jrcqsRbeRpfYSXhmLmccdgIltz5RxG1xMmMNGS+KVE5yO9Q0POVT/VLsPZyhLryNOUBeE/HFHfzUELBB3QgAavGBteqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwIhs83YFyl1tD8B+XF5uoYHfz92wPvB40XyFOAXgok=;
 b=sRcU7Rtv0skgTyWGFQI1fhymuKpD074D92mMTDKqUGjVgBGbXsbzi3t0EPjQY82X3JSDUVzISZuAaga2U7WxLFHhWBxeQYq8/yat0iJkykXetSKuGQkmRn5/7W98jC8pxUs+IRIXOHcvzkNK7qP5E3yA8ify74IqIXaK/CgOMUIf4Yh5OAjuGksUqKpfnSiD5QCBtdPy+vWaNUFyGCFYK4ApQXsyCQBMWcldjHnyCuyUSGMlBj1RSfBY1egFIlTJ4hIij+VBSxa3oE8S2s75WPwXjhQ2MH/UM+hFm+V7eYAfBQ2u/Fj8zwxHoqLPIEUjIehu01PLygpR4j+yEU1rGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:03:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 13:03:41 +0000
Message-ID: <cba4173f-8a6a-4830-a17a-10ad4994efb3@intel.com>
Date: Tue, 7 Oct 2025 15:03:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/32] drm/xe/vf: Close multi-GT GGTT shift race
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
 <20251007112641.2669655-13-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251007112641.2669655-13-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0175.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: aacc036b-d966-4f4a-20c2-08de05a1f01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjNCVTArSXM0dXZCaHlyOW8xeldaRCtOWmFrYUtHL01MRG8rMnFzQThrcDVl?=
 =?utf-8?B?TGFFaG9ObHE2YTlySUZqcHRhaSs4WSthVmdacUFZV0VPVFowYitKM2VrdFV0?=
 =?utf-8?B?UkJFcktQb1I0MXdRckNJMUpkQjV2ekFPVjhzcW03MUs1MVJYMG5tVWN6SnM3?=
 =?utf-8?B?NDRTOWdyYzVBTzMwUGZjd2NEemgrQVJWUE5uTlpFNFhIZ3hDU3UvQmpQS0tO?=
 =?utf-8?B?LzU3eEVrc2szUXg0SUN4T3dMTnFuTmZBUDdRVEl3ZHZNMlhGRXhETW83UkZT?=
 =?utf-8?B?VmNZQUc0NzVTYWREZkRwZmVSaHRjN0hLYUpPSmJiVk94NFNlRUFhWGRoQnJz?=
 =?utf-8?B?WWZkTkdTcXJoWkREdUY3SEhZVlhNWHUybys5eDBZdU51Qm1TdkFaazRMQ3Bu?=
 =?utf-8?B?ZFZJSkhUWnRNT1k0Q0IxNzgrR1dCSUJIcFNIK0VNcFJaZEFZNm55SmhPOFJD?=
 =?utf-8?B?N2JuZnZkSWIyOXdnRHdpMVl3cDA5VWNNWkFQeGxJZzF6VEt5N3BMUktDZ0p0?=
 =?utf-8?B?Z2Q0VDBDcGNJcWpBdDNuS3paRU9qdjYremZkMVZqVFAvNnJFdmFicjIvRHV2?=
 =?utf-8?B?NXpxcis0Z3A2a0NxbkI4Uy9ObGdKTi9LN1MrRkhJWEoxeU91Q3BJckJ4d1NI?=
 =?utf-8?B?OGptMFdIK0I3Ri9vcFMxblI5cWtsK2FtQnFvRWNWNWtmOWtBa05iVUkrQUhn?=
 =?utf-8?B?RXdGanVudVB2RlZLR0s3WXBvY0EzQ2xKWVJHZjVzNURBaVRlSktWL2pyRzRL?=
 =?utf-8?B?UWh1czJRVVBNd3N5eTArSm1mRnRGaHdOdGhycU1Md0djWW9Yb2FySTRjVE82?=
 =?utf-8?B?T0pwa1MvNW5FMEpLTk5OcXF0ZkRENmxIemhHQ21lZnhvQ0loMDVpeG1CR04r?=
 =?utf-8?B?dTBOQXV0YkJnQmxrckg3TkZZU2NOQjA0bE9lbWQ5eGUxUmFpRWFMWTJXaVR3?=
 =?utf-8?B?azFHUzBzM0hxWWQxSUtsVFkvUjhWZDJUaEp6dU1FSlorcjhYZ3UxSGY4Znps?=
 =?utf-8?B?U2ZjUVBqQlhFOWhQSjQvdjFXZU81bnpYZEp5Ti9JNlNZaVNhdUhRdlpaQkxW?=
 =?utf-8?B?em81NDBnUldtdGxZb3VYckwvc1h5RzNaZFF4UVR3aWFsNmtCL0ZsMTdvaXcy?=
 =?utf-8?B?aS9xc3c4V1I2UTgzUmZuTmVHL2U0dUNpT1hxTENUWkVsR3o3Szc3K3piMVpz?=
 =?utf-8?B?aE01Wmc1ZHlkUE9ad05PYlFCeGdqeU84WmZrMWxDbHJXenBNSzZ4ODdCTTZL?=
 =?utf-8?B?WkdCNGJpam50M1h6eUZaNUJMWXUrbXRUSnlBVzhteTF6R3RlbkZucGg5N2c3?=
 =?utf-8?B?Y1NsMVVIZFlBQk5IYWtKUXU1blpUdkJ5K1hONHFkdCtwbmhYYVdUakJuTno4?=
 =?utf-8?B?N21BNjBTQzRmSnU1Z0xSTldNaG96QWt2alJuZnZ3YXoreTNIZEgvZzE0R3Bl?=
 =?utf-8?B?MlpZUGNkZG95eGZieVEzN1RWcDZqZng0UUcxU3pOYjZ0REhRK3h3TCtzK0pF?=
 =?utf-8?B?NVljcHJSb0tybTJzU2FEd0h0L0V6UWtKd3hwR0dlQjFqSXpIaC9vZkNmWmpZ?=
 =?utf-8?B?MFhpTU5RWHdrSDRpbFl6WVIxdkEwSjQ1YUUvWjNRV3VBUzBLam02ZzErWXpW?=
 =?utf-8?B?OFNZMlNpYXVOZzN2L2V5MEtVRDhUcXRsMU5CMTM3QVQ5RWovWm1WeDhLQWxp?=
 =?utf-8?B?d3VXQ1duK3BQWWJvMWZFd2RzRWg0WG5HcStmZ0pKNHhJQWowSFltbUZ4QnU4?=
 =?utf-8?B?REtWeWVRNHBBd0UyZWRHOEcxMmtMREY0TnN2bFc5cWVwUGFnOW9lU0xiVXhm?=
 =?utf-8?B?aTRlNHlaU2JaNmpkMmdiYndhSFRTQVhtVGVTWlNxbFJlUVoycXZrYi90UzN6?=
 =?utf-8?B?cG9HSk9LY0R2REFiVFZ4bGdETXdJSmQ4WFJlMVVUQVNqY0NwZjZTZmkwMGwx?=
 =?utf-8?Q?SBUcHlLW8eoPbPms9IYsPW40wijXJFnV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1JuNzk3amNYV3YrQXVSclV2VVRVTjU4SDN4SVhxMHRnRGJUSVZSNWhNL2N5?=
 =?utf-8?B?NjIwNUNCRDB1OHZ0bnJhN1ZyZkQ5bDBiK1VLWUpRTEJaV3hwU2xVKzZwQ01t?=
 =?utf-8?B?cW5jNGloVGxaS1ZEek84Y252NGpjdjNlbzZVMkZ2UlN5bFBram5hOXJORWsx?=
 =?utf-8?B?R2krV2F5NmtSZTJpbS9paFhSN3hMamdqS2h2ckw5cVVhZFpIaTJ4c3dKd2lt?=
 =?utf-8?B?bnhVSDhRQWFhS1M4UUlyc2tCR3UxNE56eUtEUno3Q2pUNVVZTWlJOU4zdTdO?=
 =?utf-8?B?bmk0R1dZa21rV2ZaaHpUTXJGQm1JU3A1SXVuZXMvS1dUU3Y0dW90NGh1NkY0?=
 =?utf-8?B?UVVGR0h3QXJOTEhwMFU0Zm5FRXNPb1ViNkFHZWoyd2swMElWYVc4QjFzbkxj?=
 =?utf-8?B?UTdaTmZUMkFYaDcwbWdTdjRsWDVZRHFLbitYWC9LdElUZno4L0I3aS8xUzI4?=
 =?utf-8?B?VzV4cXlnWlo0UUh5dDJ5QjFnM2pHUDZmUmxWNGhlOTFnaDRDcnNWcEpDV0dW?=
 =?utf-8?B?ckFZRmtwMmZKdHpFSTd5NUdibXRrVEczL3IwT3FqMXZWWC9EemZOeUNhNElh?=
 =?utf-8?B?aUZQbGlVQnBIaGdXR3NkakFxejBoWmEwUXVyMkdqOGJCK25PaXJXOE1QZHJ2?=
 =?utf-8?B?ZVgrNWZYNjhrTWxBbkJOeVV0Q0p3QThRRzBRdllHSXhpUU16OUwrdDFCS09k?=
 =?utf-8?B?OTBxWkxBVDJEZVNUbXF6bDBRTUtwZXRWZHBqdlFWM1RXcjVoWWJiWFJ0dUUz?=
 =?utf-8?B?ZmI1UzdOK3U3Q0Z2K01mWEJlMU91djNZSk50YStiaTl5c3oyR3hsTXMrb05y?=
 =?utf-8?B?b3N0dGtycEt0Y0c2OWU5ZW80cnRlc0NaVVdRVlNlS2tKUWVOeUhMS24vbS9s?=
 =?utf-8?B?aEM2UDBBZ09way84aFpTa0JCSGI2UzBmQTlKRWEwQVVQYTN5Q1FPN2NrSkVB?=
 =?utf-8?B?RTFJRlZRUlVxMHc2UC9ZdXBmNG1mbGt2bUNoTmNnYk1KZ1pTbDh1MzE0NmNz?=
 =?utf-8?B?bzhod1NaTFRURXBzdjc1Wm5sclNRem8rVlJObk5FbUNhamdBM1YrVHZ4bktL?=
 =?utf-8?B?UHBVWnhqRk5CNmh3WDg1L0FzdUZWemdOWUNIZTJvZ3JKTHBHNHloWjlZZ1ZF?=
 =?utf-8?B?T1ZKeUFqRWxkeTlRUjdVcEVpSGZIYnRla3J3V3lKRjhBZTJ3SXJaSTYzNVdP?=
 =?utf-8?B?SnN2WEVub2g0Q3hjQ3U5NDVkeHc5T1N1dVRsTWVFSmlEOExWYkdoV3Q5SkIr?=
 =?utf-8?B?Rkx5WkRHZWVOeitXNkJXQTREZ1lacEdhaDl4dVIvU3lDMDJ4NW1TQXNpZFpq?=
 =?utf-8?B?NVZQMUQ1dXA1QVVsbTRtSHlENVMwcTdyK0VIOFlwb08vM3JPdXAyRW1CVzZr?=
 =?utf-8?B?MmNrSWpkTnJaSkRvZ2hwcWlCcFNkRUJza2xQOTRwaEdyU0dhTFkyN3NNVUo0?=
 =?utf-8?B?ZGtsNFFVYmkyYjQ3Y1pBMlg2ditVdjkyM3RYWE5SdjhCajBacThEbTZSWEFH?=
 =?utf-8?B?SkhPSmxWV0NFNzZqaitVd1BuT1dOQVhiNW00bDh5b2xvb0ZBUDZkTWgydFNu?=
 =?utf-8?B?RjUwbnlPTVltZjJjczVsaW1sMnEwazVMRlNLaVYzVUIyck5Mc2RYdlpNU0E0?=
 =?utf-8?B?THlBdXcyODM4WWEyRERTN2I5T1ZtYThORW40aVJPU3Z0ZHFaaDROem1naFd3?=
 =?utf-8?B?QVl0dndkUlZ0aStLOXFPSld2U1gza05STVNXQU15M1FOTUxHQit4SndxTitY?=
 =?utf-8?B?S0I5T25KbkVIWW1Vb1RMY1lLazFuWC9WQXhwSlM2cXV3SmhBNzdhNUI0d1Ry?=
 =?utf-8?B?eXlER3JGUjRTNHZXalFqKzF4bWIzNmJZMWtkRnIvQVpmNFVhWWdvQnNoeEZ1?=
 =?utf-8?B?RHVxbG0wNytldE80MkF4MlpFV2hpMlo3NDY0YkhNOVdTYmk4MFR3YzlIQkFa?=
 =?utf-8?B?Q2h3WmgrbFhwTGVwUHhKclFOSEtWL0U4VkpMYk1MMTZXUGsxb3QxeFNoRURp?=
 =?utf-8?B?K2k1NFpJcmVTL3dsOWF2c0I2eTdpcDdkYmJFc1FDdXQ3MEl5cHk2WU5lbFl5?=
 =?utf-8?B?ZjZKakFMRy9iLzlpc1BuSWlhR0J5YTRtT0FzcVVYbU56RmdTaG5yRitZamMy?=
 =?utf-8?B?bDAwcjNITDBzQmpOa2tWWG16UjNhWk1wekJ5MVArVmg3Q3RIZkx3R3U4M3VK?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aacc036b-d966-4f4a-20c2-08de05a1f01e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:03:41.1428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSBouG5X0z20Biwz45RE19iJT3gQxKYeMU93OZIaDMTQgi1t/N6wKXt8espEDw3zaIjkbodTDGNnbE0zA/PPvvJCPHpjxEhRiBUhoNbZFiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
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



On 10/7/2025 1:26 PM, Matthew Brost wrote:
> As multi-GT VF post-migration recovery can run in parallel on different
> workqueues, but both GTs point to the same GGTT, only one GT needs to
> shift the GGTT. However, both GTs need to know when this step has
> completed. To coordinate this, perform the GGTT shift under the GGTT
> lock. With shift being done under the lock, storing the shift value
> becomes unnecessary.
> 
> v3:
>  - Update commmit message (Tomasz)
> v4:
>  - Move GGTT values to tile state (Michal)
>  - Use GGTT lock (Michal)
> v5:
>  - Only take GGTT lock during recovery (CI)
>  - Drop goto in vf_get_submission_cfg (Michal)
>  - Add kernel doc around recovery in xe_gt_sriov_vf_query_config (Michal)
> v7:
>  - Drop recovery variable (Michal)
>  - Use _locked naming (Michal)
>  - Use guard (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 128 ++++++--------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   3 -
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  34 ++++--
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 ++++
>  drivers/gpu/drm/xe/xe_vram.c                |   6 +-
>  8 files changed, 95 insertions(+), 113 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1d2718b70a5c..c66523bf4bf0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -27,6 +27,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_tile_sriov_vf_types.h"
>  #include "xe_validation.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -193,6 +194,8 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +			/** @sriov.vf.self_config: VF configuration data */
> +			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 31a80d77da36..6f0bc6225fd3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -438,13 +438,18 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_guc *guc = &gt->uc.guc;
>  	u64 start, size;
> +	s64 shift;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> +	guard(mutex)(&ggtt->lock);
> +
>  	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
>  	if (unlikely(err))
>  		return err;
> @@ -462,16 +467,24 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> -	config->ggtt_shift = start - (s64)config->ggtt_base;
> +	shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;

nit: empty line here

> +	err = config->ggtt_size ? 0 : -ENODATA;
> +

nit: instead of this one

> +	if (!err && shift && shift != start) {
> +		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
> +				 shift, config->ggtt_base);
> +		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
> +	}
>  
> -	return config->ggtt_size ? 0 : -ENODATA;
> +	return err;
>  }
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile_sriov_vf_selfconfig *config =
> +		&gt_to_tile(gt)->sriov.vf.self_config;

this looks like a small layer violation

as we do have now

	xe_tile_sriov_vf_lmem()

maybe there should be both

	xe_tile_sriov_vf_lmem()
	xe_tile_sriov_vf_lmem_store()

>  	struct xe_guc *guc = &gt->uc.guc;
>  	char size_str[10];
>  	u64 size;
> @@ -545,7 +558,9 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
>   *
> - * This function is for VF use only.
> + * This function is for VF use only. This function may shift the GGTT and is
> + * performed under GGTT lock, making this step visible to all GTs that share a
> + * GGTT.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> @@ -584,80 +599,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>   */
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  {

from here
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> -
> -	return gt->sriov.vf.self_config.num_ctxs;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the LMEM assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> -
> -	return gt->sriov.vf.self_config.lmem_size;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
> -
> -	return gt->sriov.vf.self_config.ggtt_size;
> -}
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	u16 val;
>  
> -/**
> - * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: base offset of the GGTT assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
> -{
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
>  
> -	return gt->sriov.vf.self_config.ggtt_base;
> -}
> +	xe_gt_assert(gt, config->num_ctxs);
> +	val = config->num_ctxs;

and here

>  
> -/**
> - * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> - * @gt: the &xe_gt struct instance
> - *
> - * This function is for VF use only.
> - *
> - * Return: The shift value; could be negative
> - */
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> -{
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> -
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -
> -	return config->ggtt_shift;
> +	return val;

changes to the xe_gt_sriov_vf_guc_ids() seems to be unrelated?

>  }
>  
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> @@ -1057,6 +1008,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>   */
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  {
> +	struct xe_tile_sriov_vf_selfconfig *tconfig =
> +		&gt_to_tile(gt)->sriov.vf.self_config;
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	char buf[10];
> @@ -1064,17 +1017,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
>  	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
> -		   config->ggtt_base,
> -		   config->ggtt_base + config->ggtt_size - 1);
> -
> -	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
> +		   tconfig->ggtt_base,
> +		   tconfig->ggtt_base + tconfig->ggtt_size - 1);
>  
> -	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
> +	string_get_size(tconfig->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "GGTT size:\t%llu (%s)\n", tconfig->ggtt_size, buf);
>  
>  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> -		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> +		string_get_size(tconfig->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "LMEM size:\t%llu (%s)\n", tconfig->lmem_size, buf);
>  	}
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> @@ -1161,21 +1112,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>  static int vf_post_migration_fixups(struct xe_gt *gt)
>  {
>  	void *buf = gt->sriov.vf.migration.scratch;
> -	s64 shift;
>  	int err;
>  
>  	err = xe_gt_sriov_vf_query_config(gt);
>  	if (err)
>  		return err;
>  
> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -	if (shift) {
> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> -		if (err)
> -			return err;
> -	}
> +	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
> +	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0adebf8aa419..2eb793a2d8ba 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
> -u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
> -s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index e753646debc4..1796d4caf62f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_SRIOV_VF_TYPES_H_
>  #define _XE_GT_SRIOV_VF_TYPES_H_
>  
> +#include <linux/rwsem.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include "xe_uc_fw_types.h"
> @@ -14,12 +15,6 @@
>   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
>   */
>  struct xe_gt_sriov_vf_selfconfig {
> -	/** @ggtt_base: assigned base offset of the GGTT region. */
> -	u64 ggtt_base;
> -	/** @ggtt_size: assigned size of the GGTT region. */
> -	u64 ggtt_size;
> -	/** @ggtt_shift: difference in ggtt_base on last migration */
> -	s64 ggtt_shift;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;

lmem size remains as part of the GT config or is moved to Tile config?

maybe to make this patch more focused on "close multi-gt shift race" those changes where the GGTT and LMEM config is stored should be done separately?

and I know you don't like this idea ;)

>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index f221dbed16f0..7417a3aa7f9b 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -9,7 +9,6 @@
>  
>  #include "xe_assert.h"
>  #include "xe_ggtt.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_vf.h"
> @@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
> +static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
>  {
> -	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
> -	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
> +	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
> +	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
>  	struct xe_device *xe = tile_to_xe(tile);
>  	u64 wopcm = xe_wopcm_size(xe);
>  	u64 start, end;
> @@ -232,7 +231,7 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   */
>  
>  /**
> - * xe_tile_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
>   * @tile: the &xe_tile struct instance
>   * @shift: the shift value
>   *
> @@ -240,15 +239,34 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
>   * within the global space. This range might have changed during migration,
>   * which requires all memory addresses pointing to GGTT to be shifted.
>   */
> -void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
> +void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
>  {
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	mutex_lock(&ggtt->lock);
> +	lockdep_assert_held(&ggtt->lock);
>  
>  	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
>  	xe_ggtt_shift_nodes_locked(ggtt, shift);
>  	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
> +}
>  
> -	mutex_unlock(&ggtt->lock);
> +/**
> + * xe_tile_sriov_vf_lmem - VF LMEM configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the LMEM assigned to VF.
> + */
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +	u64 val;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	xe_tile_assert(tile, config->lmem_size);

while no LMEM is invalid provisioning, it is not something that we should guard by assert

> +	val = config->lmem_size;
> +
> +	return val;

do we really need to have local var for that ?

>  }
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 93eb043171e8..dd6d3b315095 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -11,8 +11,8 @@
>  struct xe_tile;
>  
>  int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
> -int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
> -void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> +void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> new file mode 100644
> index 000000000000..140717f81d8f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
> +#define _XE_TILE_SRIOV_VF_TYPES_H_
> +
> +#include <linux/mutex.h>
> +
> +/**
> + * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> + */
> +struct xe_tile_sriov_vf_selfconfig {
> +	/** @ggtt_base: assigned base offset of the GGTT region. */
> +	u64 ggtt_base;
> +	/** @ggtt_size: assigned size of the GGTT region. */
> +	u64 ggtt_size;
> +	/** @lmem_size: assigned size of the LMEM. */
> +	u64 lmem_size;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7adfccf68e4c..70bcbb188867 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,10 +17,10 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
> @@ -238,9 +238,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		offset = 0;
>  		for_each_tile(t, xe, id)
>  			for_each_if(t->id < tile->id)
> -				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> +				offset += xe_tile_sriov_vf_lmem(t);
>  
> -		*tile_size = xe_gt_sriov_vf_lmem(gt);
> +		*tile_size = xe_tile_sriov_vf_lmem(tile);
>  		*vram_size = *tile_size;
>  		*tile_offset = offset;
>  

