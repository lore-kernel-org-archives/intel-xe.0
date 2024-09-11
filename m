Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40702EE57DB
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 21:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75A410E025;
	Wed, 11 Sep 2024 21:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmamqBZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AE510E025
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726091117; x=1757627117;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uqBXmaMa+S562u2J987cunKmTZZs1nczWw42VuD5T9o=;
 b=TmamqBZvCj8DFAKBBxaz5e7pdbnKnyEZX828jrlHML4pm/Ic+B07ax7z
 9ryRWqdpXmbv4i0HlkigMXnGCEJQY8h50haRGdxVQiNSBKtYqlujaKark
 Sjgpx5MbQVstEE59Z0Z/FhqUzymcixK3F4vUIsxp70fWR6h3Jcu6wxuyf
 u+jvTr5R1CzHG3QhI9kCFU+f4rgkDJ3/QEozpBrS8BlJIurJsHgMIRzEH
 gromV2AvSOM0I5+Aw5sCX7rsV48h+NhE3p74zb15kXoojYbUwgv87VoTM
 7Qu+HVANEKfvDNji3XrYeReq6nwkJmR/N2tUF3q1XLvgN2q1RJ6rDPcS9 Q==;
X-CSE-ConnectionGUID: LF5mbSd/ThyQLTlDpK9Zlg==
X-CSE-MsgGUID: acmTH+eYSYmlvswGzDLNCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25052663"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25052663"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 14:45:17 -0700
X-CSE-ConnectionGUID: GCSoflOLTIySjn5GUe9DFQ==
X-CSE-MsgGUID: n2il15/QTFCSe8zG5j6jQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="72292431"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 14:45:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 14:45:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 14:45:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 14:45:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 14:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UK9l3t2k1PXu5FXNlsnmhSqb9FOX9+12S81Bgqks+Yomd2bRz+VdWWdOL11zn6Kw+uCW2RCd+b5eLwf2e7BXsuZib+lkhpg6UxZSb2FLNrkvL7IzzaW80KuM2wbS1s7iQPyzimVQSYSqi6l+qOLLs8ZOcFmKqx97wO8ozxmuwlfaB3GAzYU2QmchNf0oYUCfGCUpK6b9VDo9G9DhJHQ++Cf3LQm8qTuEPXfcE6llLow6uFx1Z8KI4QBTCafJnuSckOXyH0HEOYuRdGL34WkDFDnF7T42m2dV6upzO3+z46Td/4hK0AJpX0JRp+EasupAw3Fj02PEnoVmkR+61ZY5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4KTFRODg2tBFll4W9yhZn4goJGQXq4f7XQoZKU0YKc=;
 b=GSuQKKhseOfEk9j2EUQM7Ef4Z38QsZdvyHEn+4aVFic7jVr2aYD5YE71TsWQ3YV9GOmEwqKZLNvfQ/ja48xthFx4sMlvZc+5sc6NA/pHXvrDQvbzclsYje3hs36pSJ0CZawnGND5IQgaPepYgRt5aMfvsImjvzSfdygJqj3X1x71DaB5tMezBh8nzp7tBvDnsfIGw66yPrW/ye6647vVxxjaH10wTjKqMnLWYwzLf1rgD9twAdvoLZ8nBHQdMP4LWQC8iRxBggB8SREH4Iyjy5h7oHy7Fdkw7UT9e+jywSwe3bLfasAyPF/SJAKl+UaLvkySTD8r7yq88gF5WFOwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6766.namprd11.prod.outlook.com (2603:10b6:a03:47c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 11 Sep
 2024 21:45:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 21:45:12 +0000
Date: Wed, 11 Sep 2024 16:45:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5] drm/xe: Add driver load error injection
Message-ID: <d6nf4fjlksye5x2vqijk4ljgkusxvqhw44tdnvpoo2niqwavcp@gexvd2atyp36>
References: <20240910152241.1554435-1-francois.dugast@intel.com>
 <ZuC2BiKnZEaXAY1N@intel.com>
 <tpweqdb7sux3pfnz6762omn5jate6xugqfxmm7wcfq3gf7qfmv@5ukqvov3au42>
 <ZuFzhBHH3TKDAPel@fdugast-desk> <ZuICC_gKCSyxRj2H@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuICC_gKCSyxRj2H@intel.com>
X-ClientProxiedBy: MW4PR04CA0234.namprd04.prod.outlook.com
 (2603:10b6:303:87::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a65bf2-7be0-45b4-b84b-08dcd2ab03a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTRRTGpqZHN6ZlI1dU9uY2dIMk9WN3JhWmxoT3Y3SStES2lianA3SE1jNEhU?=
 =?utf-8?B?NC8vVTFpa3pFa1l2c1FUbCs5ZVQzcGpiR0pIRjcvdTMwK2ZvNGd2dnZUN3Zr?=
 =?utf-8?B?WGtsNFpLbWtyQUtxNENuVHlaYW1BREpHanVQNEZRUzY5RW41K1dSVkE2N1k5?=
 =?utf-8?B?bUZ5V1JJSTBTSy9YWTFSU2xab2VDUkpSNllYdjg4MTlhbmpDRDMyTU8vdlNj?=
 =?utf-8?B?LzRudlphKzFWQVZqRlRSMXl4RGV4RlFqWmlCM0lUa2o4YTBxSzl1Z015akM2?=
 =?utf-8?B?dFdyU3ZSbkpPN1p6b1FnRGZlWE5DQkx5Y3ptOWdmVHlYNVhJU0VFczB0NDNY?=
 =?utf-8?B?VFFiMFR4WnRwTmtjL21EZi9zbDVlbUlVaFZaZy9MRis3S0FzNkJwb1JFTi9N?=
 =?utf-8?B?QzFTeDdFb1ptZFF5TWJhWHRyMEViTnUyVWlrbms3Q2tZZGVGaFVHaHcvVVJG?=
 =?utf-8?B?Zmd4cEV3ZGEwb3hGbXVGc09BeENLcENDUWEyUUM5b3hTOHRISFlCVXdOaTdT?=
 =?utf-8?B?ckMxWnJQS3owY2oyRTRwQXJ2WHlOSUFqTTFCeXNvaDMzNzdobmZFcWtvc1kr?=
 =?utf-8?B?S0V4dDJuSnhmWXdmUmhHMXhyM1ZFc1BPZjN1WGtKcVcvSGxJMmlOM2M0dWVX?=
 =?utf-8?B?ejlZMnU4V0FEdGQ3MU45MjhjUkhaNml0Vis1QUxPZE4wRVBWNnBDUWZyUHRP?=
 =?utf-8?B?Z2ZDQ0s3eU9MRnVFeDJoWlgyeUJqbjhaL1liNTZVd25EeUFkZXR2LzF1Rnll?=
 =?utf-8?B?eHZUaS9xU3pDL001WSt6amZtUE9nVDBwTUI5TDh5b2k1V0NZZVBZN3RTczg4?=
 =?utf-8?B?YWJPQk1Zczc2c21rYlRYUGlCOExWQlo0eWdIU0pDNTNnN3RZVzFObkxPeHo1?=
 =?utf-8?B?bEN4TkxydCtKMnVjRmtyNWtDaG9iTVJrb2d6U0RqTE5BaTZlQXFCbWxrU252?=
 =?utf-8?B?a1VmRC9wdGZvNWRXVnpEbkNKQ2NEdWI5Y2w2VXJ1UTFNZVBHbWpTTjNlY044?=
 =?utf-8?B?U1RTbG13SG1yN1k4NHpiNGtKbVVtd2Q4YlV3T2N2ZGxjTXQ3T2p4ZXhZcnJF?=
 =?utf-8?B?TFIxOHNaZGVnZzBnYWFnSmZ6SzNRYTVhZFJNVUZLVTJHOTQ5akJra0h5ZVpu?=
 =?utf-8?B?bVdGTHVub2l6d1ZvaVp5dVlmY2ExSFlJY29jN1RVWDdoODZpM3UrU3d1Z1JI?=
 =?utf-8?B?eVVxSjk0dDc3akIyQ2g5OEhBMENWdFhZSU5UejY1Mm10a0VrOHJ1OVlwVDFH?=
 =?utf-8?B?Rmx4ZldoekgwbU1DY2tTd2VoVTlFeFo0VWVaU3pKSGRFYnF0RE8wQ0FWYXhB?=
 =?utf-8?B?L3lWZDkwTGpTWVFqRHkrNHVXZzNYQ0dwc3liWTR1U05wU0JCTnZjZzRjWE51?=
 =?utf-8?B?UGIrREtSSGd4SC9ucm5BZXNrZDcxYUFkaEhuc3diK1o4bzZRUjFzOVRxQXE1?=
 =?utf-8?B?OVpKSHVLQU15Q0d3NzFET0ZLeldZUDkzT1B5cXBOZWNJQncwWnl3d3FSaGgz?=
 =?utf-8?B?WXNFaUV5QkYySXRqYS9FdUdlTzU1eHMzNDV6U3BNZXBxK1JUTURoK2ZodGdD?=
 =?utf-8?B?alFsem85bUowbDkrOHVqVEZPUU1BMktjSDAzNlY5Q2NlSFhBcnlhZjJkNDJC?=
 =?utf-8?B?emRvUElab1NlaGR5QW44QlhWVmc1ZzJFS2dKTXJGL1cwNWE2Q2FzMDZvcXZt?=
 =?utf-8?B?STJqNUlUbloxaE1GNGlGbGo3ejFMaGNxbGdheUJIZHhvNEZhSjM4dkV4TEZE?=
 =?utf-8?B?VXNWWWFLV2hEbkhWUVd6djFoWFBGalErVjd0bStnOEM0V3IyQlVjcGNCVk5H?=
 =?utf-8?Q?3LgLIsmUb4nYaXgxMxiRGD/nNrxzhPyHWnu54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5reERFQlpONDQ0dG1YNEpzTU5mQ0lQMStYZnJ2VFBCL3lYL3lqODBWY2U1?=
 =?utf-8?B?NVVjNzZsQUdlNGFGVElad2R1ay9UYW9rbTVOY25hU0JVaUw4MGdPaFFSVTZ6?=
 =?utf-8?B?aFI0UWxrNW9lc0JScGowWXBGajFGTHBpWnRXQ1RnaDFVRndhbkk4SFZuSGhU?=
 =?utf-8?B?Z2JnaVYyR25Qc0gvUVN1NkFYaHNBN2NpZ0tFcnp4QnVVTlRwMXZSdVhyWVVo?=
 =?utf-8?B?YUo1OXIzTFFXMmZSM2xoOTZmcXVYSUJUQjJ0RTZFTlZpRzVhWlJiRlY5aEVW?=
 =?utf-8?B?d043aENDRzg4YVFFVmZ3TnBnSkR1VmdtemZONkRxVEJJQk1pK3hJRUNKTFEy?=
 =?utf-8?B?T3YzSkJrTkxmQWwzb2VwajZiRk9OZU96UFAwKyt2WDZXODhwUjRoWTF6YTJF?=
 =?utf-8?B?QjllRnNGLzIxMjhwQXl3VnEzNmlYOG4wZmk0WWZ6Ui83MDJ3Nk1ZU3dUZkw2?=
 =?utf-8?B?QnNrUFJWZUZybTNGeXNzdGJ3V2FBaGFocWV4YXFvQW1ETkZHK1JXUys5eFkw?=
 =?utf-8?B?VGlTYTc0RlpPRzJ0NnV3ZXN2Q0gvMmZ5Slp5ZkMreXZhYUZHRkovV1NoMkpt?=
 =?utf-8?B?SWpKRnJtWUo3dlVRNEttdjZYdWV5bTJoN1IyTnNMODkyeEtsZzFlOGlLVC9M?=
 =?utf-8?B?S3dkS2lrbzBjSzhhSmFZQWZ1anV5cWpxU3NxWlRKVExzOWY5UkR1ZnBRVGo2?=
 =?utf-8?B?TDJldFFwR1huajYwWi9tV3N3Q0Z2a0VjalY5QUZkVUdhTmdDTFM0YnBGVHVa?=
 =?utf-8?B?MUxacHFqZ0w0cGRuNUR2cCtHWGZndXJKSE9HNG1rVmFOajRkbEdsdFB5ZGF3?=
 =?utf-8?B?VEtDT3VuNEFkT2R1RS9RNFdhS2thdC9uS2xYWjJwTEJGRUpPTUtVYm5nNFVL?=
 =?utf-8?B?VnNUQmNuMlJOQWNLZ1cxbGFkZEQzMmhJUFJpeHVjVHV4WEk2VHRkMWRvQXBI?=
 =?utf-8?B?aVhzZHk1TGwwbFRGR2pwU2QvS3U2cWRjcTZIaTk3RG9zajZnZGd3YzIxM05E?=
 =?utf-8?B?WkdnUFVMZ2NDQWt3aTZBb25FSVNCb2VmRzRGM3BwNDI5Y01VNHdjYlIxc21M?=
 =?utf-8?B?ZHVzYVppUHRROUxZQWFVTHVVSzRUcXY4RENmZHFlK0ZOY0RBM0FyaDlBOC9S?=
 =?utf-8?B?SE9wMnA1Q3h0UlZ2S0lYdE1ZQmZNNzhheVhZUU8yWnhmL3hrMUFQQ0FVcEZJ?=
 =?utf-8?B?ajFkMHM4Z1FZYUFudzk0dm1qOC9ueWw3cjdKVGE4cUM4bDVmM0tWMmVEcFdQ?=
 =?utf-8?B?QU5DNnNjMmJLekRXdHhXaGVscDhRbVR3SlcyeGo0TjVOMmg4Ri9aamxWRWw3?=
 =?utf-8?B?SFFQNHpVZ2I0aTljNzBkRFBmREgvVkcvbU5MdGgxbjhYL1BVVzdwK0JHOXZ4?=
 =?utf-8?B?Z3VaNGV0dGJNa2loMlEvZWtNdDZBS3JJVGx0STFZa3Fwekk2Q0lpTVRlS3FM?=
 =?utf-8?B?YmV3L2Ixa0djQW9rc1VSc3E1N1dmUmFyNHR3enR3K1JJRzh0NkV4am9RNVFj?=
 =?utf-8?B?azVmYTR1K1kwUVkrQUwvbVc4QXhZa2NvSVpOb25UTnFpeE5EeTR6VmZVSzN0?=
 =?utf-8?B?S2dmTnJKVWRpazhyNTlwKy8zOFB1eG5Xc3BZTDcxdVIzOXJqNDd3a3RIazYy?=
 =?utf-8?B?SEo3aVREdHFMd2NtYm9TMVdvRkFOb2F4MDdzWGFpNklCc2x4L1dLMWNxdlM5?=
 =?utf-8?B?cHhpd0VDVExpS1lPVC9aMXBuNlRRSE4xT1ZPNENQeUtUby9ySy8zdjZyYXVG?=
 =?utf-8?B?WEtYTlBNS0M5OWI5QU5nclVnc0gxRURoMGdEVXpiRy9ISE5DZDFVdjFVV29Z?=
 =?utf-8?B?WnE2dXlwd0RDMVRCTk92T09pR0tTM05JaklZNHArM2c0dENMMXhLcjRZMDVM?=
 =?utf-8?B?K0xWOTg4NHhrR3d6Mms1WlBrVldoMHcvUU83UmViQkYrTU5aVzRkTitkNDVk?=
 =?utf-8?B?M3hPVXIvMlpkaE1VNWE0QkFLd1V6NW9RV081MXVWdmRSVnA3Vk4rRnY2U3o0?=
 =?utf-8?B?R3B4V3NBeEdrZnBtMm8yNUtVc3E0ZGdwSms5Z1h4UEpGZ2QvUjJ0OFVmaGpw?=
 =?utf-8?B?L2pkVk93RG5MUHRzdDFMcFJmVEdIQndISmdTZlF6d01RekJ6OWpvU3JRSm9I?=
 =?utf-8?B?eG9EZllHNjczTGdBOTFtbHEzTDFlM3l2Vnd2NkdIVklSQ0hIaUEvL3JUMmpS?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a65bf2-7be0-45b4-b84b-08dcd2ab03a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 21:45:12.4644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2yW3VWT0PcMC3itLSWo1Hhi2h0ly1cZWNn6SuFc/zEtefrYQYN7hkBsoZmSJ/MmCLMcadlOR6EDfwBhQ62vZTBEW5YJkH8a/uUle7Xk4M4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6766
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

On Wed, Sep 11, 2024 at 04:48:11PM GMT, Rodrigo Vivi wrote:
>On Wed, Sep 11, 2024 at 12:40:04PM +0200, Francois Dugast wrote:
>> On Tue, Sep 10, 2024 at 04:33:21PM -0500, Lucas De Marchi wrote:
>> > On Tue, Sep 10, 2024 at 05:11:34PM GMT, Rodrigo Vivi wrote:
>> > > On Tue, Sep 10, 2024 at 05:22:41PM +0200, Francois Dugast wrote:
>> > > > Those new macros inject errors by overriding return codes. They must
>> > > > manually be called, preferably at the very beginning of the function
>> > > > that will fault, otherwise if not possible by turning this pattern:
>> > > >
>> > > >     err = foo();
>> > > >     if (err)
>> > > >         return err;
>> > > >
>> > > > into:
>> > > >
>> > > >     err = foo();
>> > > >     err = xe_device_inject_driver_probe_error(xe, err);
>> > > >     if (err)
>> > > >         return err;
>> > > >
>> > > > When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
>> > > >
>> > > > When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
>> > > > be overridden when the module argument inject_driver_load_error is
>> > > > set to value X. By doing so, it is possible to test proper error
>> > > > handling and improve robustness for current and future code. A few
>> > > > injection points are added in this patch but more need to be added.
>> > > > One way to use this error injection at driver probe is:
>> > > >
>> > > >     for i in {1..200}; do
>> > > >         echo "Run $i"
>> > > >         modprobe xe inject_driver_probe_error=$i;
>> > > >         rmmod xe;
>> > > >     done
>> > >
>> > > can we have an IGT test so we ensure that CI is tracking and we are working
>> > > to close the existing issues?
>> >
>> > yeah.. that would be great. I think it would make more sense to use
>> > bind/unbind in igt.
>
>Hmm... but that would require a deferred_probe and then the bind to force the reprobe...
>kind of complicate things here...

I don't get it. The only thing required is to set a param, try bind, rinse
and repeat until module loads or fails with an extraneous error.

typing something here without really compiling and giving much thought


	device = arg_or_scan(); // 0000:00:02.0, 0000:03:00.0, etc...
	d = open("/sys/bus/pci", O_RDONLY);
	igt_sysfs_set(d, "drivers_autoprobe", "0");
	close(d);

	igt_assert_eq(modprobe("xe"), 0);

	d = open("/sys/module/xe/parameters/", O_RDONLY);

	for (n = 1, ret = INJECTION_FAULT_CODE; ret; n++) {
		igt_sysfs_printf(d, "inject_driver_probe_error", "%d", n);
		ret = bind(device);
		if (!ret) {
			igt_debug("Tested %d fault injection points, probe completed\n", n);
		}
		igt_assert(ret == 0 || ret == INJECTION_FAULT_CODE);
	}

	unbind(device);
	close(d);
	// reset it back so it doesn't affect other tests
	igt_sysfs_set(d, "drivers_autoprobe", "1");


when migrating to real fault-injection, I think we'd basically list the
functions where the fault injection can be added and replace the loop
above by writing the function name in the proper debugfs file, together
with other needed settings.

>
>> >
>> > >
>> > > >
>> > > > In the future this is expected to be replaced by the infrastructure
>> > > > provided by fault-inject.h
>> > >
>> > > I was taking a look at the fault-inject again. It could easily be a
>> > > global fault_attr with a module sysfs entry, then during the test
>> > > you load the module, then unbind the device, then change the fault-inject
>> > > probability and time and then bind it back what will reprobe, but now
>> > > with the fault-injected.
>> > >
>> > > The only problem with the fault-inject idea is that it would require
>> > > a very granular thing with multiple fault_attr, one per failure.
>> >
>> > when going with a real fault-injection, I'd actually try to cover it per
>> > function as described here:
>> >
>> > https://docs.kernel.org/fault-injection/fault-injection.html
>> > 	/sys/kernel/debug/fail_function/inject:
>> >
>> > 	Format: { ‘function-name’ | ‘!function-name’ | ‘’ }
>> >
>> > 	specifies the target function of error injection by name. If the
>> > 	function name leads ‘!’ prefix, given function is removed from injection
>> > 	list. If nothing specified (‘’) injection list is cleared.
>> >
>> > Integration via ALLOW_ERROR_INJECTION() is similar to the
>> > KUNIT_STATIC_STUB_REDIRECT() we already use.
>> >
>> > In my review I didn't bother to go with fault-inject directly because we
>> > will probably need to refactor the code so the failure points are in
>> > their own functions. Something we don't have today. Short term it's
>> > important to fix the current/unknown problems. Mid term we can convert
>> > things piece meal.
>> >
>> > Are we on the same page?
>>
>> It is also my intention with this patch, get something in with minimal risk
>> and changes so we can soon focus on solving potential issues it highlights.
>>
>> In parallel I am preparing a RFC based on fault-inject with a proposal how
>> we can use fail_function with a few real examples from our code that we can
>> take more time to discuss thoroughly.
>
>I'm also on the same page. Let's do it.
>
>But we need to at least:
>1. fix the documentation return statement
>2. fix checkpatch on module_param_named_unsafe huge line

and maybe make it already rw so we can try the bind approach above.

>3. IGT ?!

if we are running it manually, I think it should be enough.
Because running this in CI for every patch series will be a
pain until the test becomes an always-passing thing.

Lucas De Marchi
