Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18A6CF648B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 23:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5EA10ED35;
	Fri, 27 Sep 2024 23:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+iSNRt9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADFF10ED35
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727478355; x=1759014355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=areyYFb146gMfaUykNByq5BjX3coW3bRr4arc7kpkOg=;
 b=B+iSNRt90vBytmFvjj15AEQt2jrf8RtiRpkYePeomyYiEgBdRNdOnpyH
 0NHqrLPE0I0sz7Ik5++Qpe2JZ9qKrwt67PqztBxvm2/LvOYQnM0ICOlNi
 EUpsHAtdw0zI4qU0zpb+snm2ki5v78Kd7bgI5tauos8EhBUjy8Mtls0PT
 L7jwzn8Vh2wW1Ggvkp1rE8/dC0m49H24fgajbLKq5zgvVXg3UcLm2belr
 t7LpYHR0htW/zhlv/wbmZL2ayU5uMUfCCEc2mSB9beLUz2Rwyizg3zKLf
 o5smlBwt3ULkdW2uq2MoanlTIf/Ycq8mEp2e1mYpqHGWid7PCu5/8Chw/ Q==;
X-CSE-ConnectionGUID: Sn3Cw8DuThOLXHjUxkntIg==
X-CSE-MsgGUID: hnaYdFnpSr+oZ59FNXpAdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26510596"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26510596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 16:05:54 -0700
X-CSE-ConnectionGUID: 2xr+GfmKTNGBEk2jAjVVFg==
X-CSE-MsgGUID: UpuGV5rgQn+MSje0X3StKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77505645"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 16:05:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 16:05:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 16:05:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 16:05:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 16:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYpTMpIyj825L1FZ7mjzgm4g+YlwSmgbDZvkhgj1TsLfYwAovXHGSzMAiiCUh6lFw0hL4FyrjM8xOhkzQU+IFiVHk822B53Ao/KomKp+9fp36+EUbnDl22k3im3TARVnfNcek8cvNWSX3F7R0nr0FfhwjvuEVIxY0VQWuB1V2fAA/RkwbMBKe5MbNFAe/3AOoPDt+ZBKVnzSt9ehvVk/Xe9pgxNzoqQqO0V7TmkRXyH4h7wNlb0IBpsO4uIrHebfYbq34J2LCLnLK9ysOGDUdkrH3Abi6A0yvQMPflhbwItNDcBvFVArXuZOpmXhSxA5ej8E5p+5rR8b356op4RI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl+ceDfJxV+bSJB7DUvIewzsVoWrmuCVjkHomcjEDU8=;
 b=CortdELnEOEGCzEOjfxR1KQ+9BP9UemFm+bN7CUawzJwSLm3C0EFsL8440qpF42gzpChDHhyXkjRMapah/xlciaWLu19d0AYTSG5rdWZQxKGa2IuXNzOHLiiRVdAArymJ5nOyJediW0ZfzwC4CR5K5G37ZPor1S0rAgbM/kW/LKCYO8MyoLFvNdhb+dGJLB0jRZK7alvHTa74+znNu7qP5jdBg+rKmbrnrX8jMi8NcJY3USOuBISE5wYNM0ezXJjYNsHbZ0s1kxwXbDK5T8c+1r7Q83l2VgURCZ7hiocry+ixheVAjI0Xj3foeRTR+GHb7HfO62Zb+tX5VsrkKrE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Fri, 27 Sep
 2024 23:05:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 23:05:50 +0000
Message-ID: <e2f109e3-d34c-4461-bfda-910965a14ce9@intel.com>
Date: Fri, 27 Sep 2024 16:05:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc_submit: improve schedule disable error logging
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240927133535.548793-2-matthew.auld@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240927133535.548793-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:303:b6::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: ca64ee22-272f-4fb2-34ce-08dcdf48ee0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1BtLzZyZmhEekcyRWRJRFVjSlh0akxEVE1ITlZCbnVOdmxFTi9idjdRc3lx?=
 =?utf-8?B?L2RoNzF0c2NjZXlla0g0Vi9qbVdKeHZOdFlxTXdKeTc2aldVbnJHZkFIdHlF?=
 =?utf-8?B?WHNna0pidkRCWUd1VjgyL1UycE5zdnBaZmEwY1RabmhzSWk4ejBLUkMrWXlp?=
 =?utf-8?B?NXlybHM5R3NpODMwMW5zRzBtMXhPTWhIUjVuVXBRd3NQRmorZTB1VkhYY0Q3?=
 =?utf-8?B?eUFrSjdCQzBqVTlsbHNkdUEvcU4yWUd0Y01JbTJhcHZ2di9CN1pzZDIrTzFY?=
 =?utf-8?B?VFJqMDVnb2o5MWF6YXFPRFg0VncvTFIvU1Ewdkt3Z3d0RWFRbG9VRlpJdVhk?=
 =?utf-8?B?bDdmVndxUDl4SkxZb2N1TkNaTEljWFZ4eThWUzdnaDFuTU9NVktmNi9SYVBn?=
 =?utf-8?B?ZDVMOURmYUxaeTJLUWJtQVZqU0NtR1VvMWJXMitiODROUHhLK3lPdkpXL0I3?=
 =?utf-8?B?WTdCTTJKa05TbGNaTVdnaFNKYjVuUEY1QVczM0p3TUllL05Tam11YjhTbXJB?=
 =?utf-8?B?U1FDUzdUbDN6RDduZGtpMmg2YmxMSFJ3M3ZTb1hRaC9qWEJnQ3F4Smc0ZW53?=
 =?utf-8?B?RjhXY1pBYlI5QW5OSk5ONi83UlJWQngvS04wSWJzUlpTOTZVelBPWGtpQS9I?=
 =?utf-8?B?UzRTcXRoTnFQTWJtMGd4OHhmU2k0QVowUzB0U1FXazR4ZzJEWENwUjE5dzdw?=
 =?utf-8?B?UmplNUtXcnZVcDJNY01WWWRIOGNSWmJvaW03R3VzTm8yUzlYaUErUWIrcFRa?=
 =?utf-8?B?RGp2b2dSbDZraTVkbXF3UE94cmV0VS8ySXhUck01QkFOYTQvWnk4R3ZZbUkw?=
 =?utf-8?B?MnR3TUd4U1I3RjBXY0xYWkJRa0ZUSkVtYzgvbCtvdmltL29TTnJPbnQ4bGlD?=
 =?utf-8?B?bSsvelBOL3UwTk5OSjBLaDRnVk4yRG52SDhlSXVJdFNIdFdjcGxGM0tZcGNz?=
 =?utf-8?B?K0MrcU5xQnUvWTBWTlE2b2owdi8xSU5BUjU0cnVwQTAwKysyS2lRbDlibmpN?=
 =?utf-8?B?MEVRZVdEWnNhYXhCS2t1T3V3R1hTdUZBMFMrQWVGQkN5TXVLUDl5TUxQNm9O?=
 =?utf-8?B?UDN3emJqRkxLZW8wSFIwQ2VrOE95Mm1jMnlhYXdnOTdMZkFFNVVYVzR5ZW03?=
 =?utf-8?B?TWRlMURKZ091aW16dngyS1BQdDdUQjdtTStBT2xHTEpiWkVYVmJmM3EyT1lo?=
 =?utf-8?B?YkJWeDFRc1lrcnZwWE5pMEtmTmdDRGpKQ0V5c2c3d0JpM0tMSC85VmV5bFJ5?=
 =?utf-8?B?WEliazdhZCtZMzBWY3VwV1RKMmFGTEJNcXY2LzRzVmsrUnNiYWlFR3VMaE54?=
 =?utf-8?B?cFZ5dWxIcjZsK25wOW5lSk9odFJmRVVuNWUrcDJ3SDF1R1kyY3QyWjJMMklr?=
 =?utf-8?B?WXBVai9ybDVyVWpVTjl1Qys4RGJ0RGV1Q2tHMnNPT1ZVZ2QvRWJvazVaMGMy?=
 =?utf-8?B?L1k5Zm5NODJZdFBhNk1iVGF5MVZwd1Q1aXliaDhDVTRsMVEweXV3U0NpdnZD?=
 =?utf-8?B?Q0hEZGRmSlhVMjNGWDkzekFzWm13aDVGVG5YcElEYllQRU1XSWJZbmZVZFFC?=
 =?utf-8?B?blNrQmVsMWNha1VDWXNWNkcvTGcwRjJ6dGVqSXA3T1FJVk9yV2xZOVZQeXBl?=
 =?utf-8?Q?grLCQ1fhko8x5evxkWBWBGGj6fFcgiecEZiFWkHM3dL0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVKT2ZXcFkwVm9zcEdHUElJQit2bUh5aHJOdUZKajVtc1VuLzR3VzQvdU9T?=
 =?utf-8?B?M21RTUxQSkZwaWtNaVpuY2RzTkZLeWMwQ1dUVURaalV5Znowd1ZGRTNIdW1Y?=
 =?utf-8?B?SHpOV3c3c0FHUzlQcFJOM0JQVTAyWTk0ZmFKbnRBejA5MlJLMkJCRE8yMmth?=
 =?utf-8?B?RUJheXdYaVBMRWdGazZzcGZOa1BHOWhWVXpFVTF2aXpqdnNaQjB5YTExcXJO?=
 =?utf-8?B?NDkvaVZUWVVydm80bGhuMVFFQVRKamFORUVhYmU3VlVkNU45QmZQT3h0SUZv?=
 =?utf-8?B?WG4vZHhkQVlYTTZYWnFIR0J0cFZzZ3F5Ylk2OW53Z1BrTTI3S0FrUTYvamsr?=
 =?utf-8?B?QzFBcWhxWEFRZ201a1VTeWoyNnNvd2hlT1VvclpRaFhZRHo0UWg5VXdseGo0?=
 =?utf-8?B?cE9IVlNnQkNCQ2poMFJra2tYRWZobVdGZm9YOVM3RHpWcnN0Um51b2VIZlFq?=
 =?utf-8?B?cWpvdFoza1d3NVlXRHZZM1VSQVBYM052MS9nVURNVWVmTmJPbStabFk4Zndr?=
 =?utf-8?B?eVIwNHBscFFmRTNKWVl1THhzbzVJTXNtWHBmSlpxZWMzK29qaUZaQ0grdEVV?=
 =?utf-8?B?cVViQzRXSjRzK0ZLcTRocTFUbi9tOU9ENS9xSU4wTjJUdzN6U2FHSmFjSzQy?=
 =?utf-8?B?VUVaRUltSnJNb1Q1emtLcWF4NmYwbUVERDNEQXhyTURpd1k0RlI0NnpWVVU3?=
 =?utf-8?B?L1JML2dvV3pjdHE4dzFVME82TkRCRk1hQjBvZ1VPV0hrOEwxeUV6bTloZFph?=
 =?utf-8?B?Q0J0S1VtaGgvRTlWOWplbUgySmZ2dGYyckp2QnJGNkdnYm1aaC8xWXZWOS9q?=
 =?utf-8?B?UzNGcC9lOGpXRG5IN2ZPWTE0dTljcHFwZDlFcFB5L0FORmhQMWVTREFzbjFn?=
 =?utf-8?B?Q2ZmOGFuUVNweE1mQnBYcUNYR2tjOVAyazlMVHliS2hyV1ozN3RZZW9FaDBq?=
 =?utf-8?B?dXhwcU0xeUdBUnFIdWUvVC85Nmp0R1dQcnVKOS9mUkJIVksxbFE3dHlrdlQ5?=
 =?utf-8?B?WXZsUjdFTnRHcFA2MExVMFkxcXZwWnRuYnJxVm1tcVUzbnpxZ1VhU2xnbS85?=
 =?utf-8?B?RmdLL3dvenkxNGhWbXdqdlpIMjZBcDFtV2dCWWJISFh5WSs4bHhIb2ZkWXA1?=
 =?utf-8?B?Y0hZWitkT2QyY1lmaTdsZFhEdFd0dEhxVVVUQjM3YXplWGdiVmM0N3JKY0ZR?=
 =?utf-8?B?ZFFkVkYrNGJoa2VrT1hJR2hhdDVwKytPUlgyRWZmckpodDZmV0dZUmdST1FQ?=
 =?utf-8?B?ajR0R2FLRWUxazJGM1M5TVV5K1BPaWFJTzZVT1dLRi9wMTRhNVIwdElkbkVR?=
 =?utf-8?B?UWFqVDJ2RnVJb01Vd09PVWlaazhCcDBISnVvVUNjTFE2Sy9od1F6Um1pNGFl?=
 =?utf-8?B?WW9BRW1XaXY3Y2Yrb3FkNFkrdEVTTWNPeE9VL2dQd05HaFR4WlcrazdWNFBn?=
 =?utf-8?B?VGR0anZZYkFPc3l6Zy9aTWRwYUhGdFowdzVsZndQQnFZVUt2R0wxNkdVTU1j?=
 =?utf-8?B?ZHhJRjhUU1gzMnhoUDhlMjkxNFIyNG5nbFZ2UEYwbU1VSW9reVlraTlVUU1t?=
 =?utf-8?B?ZzZhdGdOUGZZQUVJQkJybExhamNKK2dPZE1qR2tBeUJQSFJHdzJhMkVrVHd6?=
 =?utf-8?B?U0doMGZmUy9zQk9yS0NBdVNjTlVvcHFmRDhtYUMwTEZsT0xrUFNkZHU4RTFI?=
 =?utf-8?B?QmdSVGxubVp1YWRpQjk3clRkSzVEblliYUF2YkwvdnFuaEk4MjZDVTUzbHNw?=
 =?utf-8?B?RzJLaVBMbTBEMUpXaUZsV3hOamtKQWFFVGx1b0xpOVV2UTJZR1pWakFDajdH?=
 =?utf-8?B?T0V6a0tsTVk4WkhwT2hCOWhXczF0WXVRRTl0UEhUME01b3Y2RFovNUczU1BP?=
 =?utf-8?B?MUlSZmxscnQ3UjJZVUs0Mm1Gc29PYTNOR1pydGgxdGt5TkZHSkgzMXNHWFFV?=
 =?utf-8?B?b1cxY3NIM2FQcVkvVmhrY2pYdXhPWVNEa0U5V1RkR3lYOVdqTTVMcStrN0xD?=
 =?utf-8?B?NjV1S3NjOFpKUVFoYUg2S3FjZ2dDSHJ2OGVFSkRkYWplWGRJTTVRQnEyL3Iy?=
 =?utf-8?B?b3ZLcExsK3lYaU1JNXlkSHA3TmptVm5qc0JJMzZuTHZvbHNrSHdYbnkwSC9J?=
 =?utf-8?B?SmVrMnRybk5PUmQ4WXhhanh0L0FEMmFocnZuQUJ5OWFLR0RLckJ2L3h3aTlD?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca64ee22-272f-4fb2-34ce-08dcdf48ee0d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 23:05:50.5792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EauBcUHTqbS9dnRA6zPKdKsp/7ZDTQVWGoDEnufQEN9hGtDhscqahuKi5eybzgylyX9GK9ig2T16bY6rt0WnWS92CKDlYNyiZLMJdtypDqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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

On 9/27/2024 06:35, Matthew Auld wrote:
> A few things here. Make the two prints consistent (and distinct), print
> the guc_id, and finally dump the CT queues. It should be possible to
> spot the guc_id in the CT queue dump, and for example see that host side
> has yet to process the response for the schedule disable, or see that
> GuC is yet to send it, to help narrow things down if we trigger the
> timeout.
Where are you seeing these failures? Is there an understanding of why? 
Or is this patch basically a "we have no idea what is going on, so get 
better logs out of CI" type thing? In which case you really want is to 
generate a devcoredump (with my debug improvements patch set to include 
the GuC log and such like) and to get CI to give you the core dumps back.

And maybe this is related to the fix from Badal: "drm/xe/guc: In 
guc_ct_send_recv flush g2h worker if g2h resp times out"? We have seen 
problems where the worker is simply not getting to run before the 
timeout expires.

John.

>
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80062e1d3f66..52ed7c0043f9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -977,7 +977,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   					 !exec_queue_pending_disable(q) ||
>   					 guc_read_stopped(guc), HZ * 5);
>   		if (!ret) {
> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> +			struct xe_gt *gt = guc_to_gt(guc);
> +			struct drm_printer p = xe_gt_err_printer(gt);
> +
> +			xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> +				   __func__, ge->id);
> +			xe_guc_ct_print(&guc->ct, &p, false);
>   			xe_sched_submission_start(sched);
>   			xe_gt_reset_async(q->gt);
>   			return;
> @@ -1177,8 +1182,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   					 guc_read_stopped(guc), HZ * 5);
>   		if (!ret || guc_read_stopped(guc)) {
>   trigger_reset:
> -			if (!ret)
> -				xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
> +			if (!ret) {
> +				struct xe_gt *gt = guc_to_gt(guc);
> +				struct drm_printer p = xe_gt_err_printer(gt);
> +
> +				xe_gt_warn(gt, "%s schedule disable failed to respond guc_id=%d",
> +					   __func__, q->guc->id);
> +				xe_guc_ct_print(&guc->ct, &p, true);
> +			}
>   			set_exec_queue_extra_ref(q);
>   			xe_exec_queue_get(q);	/* GT reset owns this */
>   			set_exec_queue_banned(q);

