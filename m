Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2F7C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB6C10E99D;
	Tue, 21 May 2024 09:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqZkvnwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DF810E99E
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716283896; x=1747819896;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iTQe2vYfqyf3bSLcHYVGoQiKALIY7m5gzqGC4eA8NmY=;
 b=kqZkvnwvbKeJAjhi5etNUIl59KnfYpe5ZiO6f4DYFxTi+pFeOhY6LF4N
 8DCSMH43aMVShNioKRz8PUdBzVEjFSVzxaKfb6BrRAWpTWKZx2aQ+hs1N
 cN7Q8rIKFbOlTn4NxU/Eok2lBu0V4TaZfOHuitE9odBa2qFnU6qubQ2aL
 FQM5gEP7koXksEsyNbDMxv73Z0MGnaYtd+NW7gcX5XZcbrN4vMW0kATjg
 Nksi8gENr/ZVrN5FpmjtypqR6zWwgYGuiP9q8bqM54M0zfuiu/5lEZmfx
 K5/B/xmRqam9APOwn7Bcxxp3nq8k6JIm6Shdbqo6El2RkwSGDZ5IonDdP A==;
X-CSE-ConnectionGUID: wn+UcgpxQR2ea7XrdbN9HQ==
X-CSE-MsgGUID: ZOtHatkhR6ufYu+hdZ8XOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12687216"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12687216"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:31:35 -0700
X-CSE-ConnectionGUID: Ll0444/YSaK0jaRKqQo9iA==
X-CSE-MsgGUID: U01wS3v6S7CwX/RctDu3iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="33280761"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 02:31:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 02:31:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 02:31:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 02:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYPXn6Brn3zz8EFopm4qVju8nC8vh+SVTEeOJNIKJeezTrR/BVuz7W8r3cPqyQsyv1GVqDpeADm2rE6QLwTczNeu8CNOsgsWnXYTpvmGvlVD5PLOIZSYlRheIG+B4uNHrUwt3cD+DnHn7IGTtK7S8QKl36L8jizruM08/kcuF19tjJwH3tCDIzEaTW/yDpATTYDmGmXGCisCaEtHTOccz1Rlg0ruE0ba7m1GoV9x8xwn0oR/x2uEhhdoEBnq69v9og5aq4nHLJC/0PckDscxgY7aIVN8BJhYBfMPfj9XoGLkIbUptln7TKVVQh+P0QYqAboAWhqzN9VzdpLtTrDYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qSDi+d9GGVrfvUoPFThfo2EYsisB0ZV6riieFgHiDo=;
 b=maHEMuqTYFaQYQnTX1ZIdpdPsncbd9Wkx5JV9kIlkPQSWCQpdw89nDrSmaGfN2JP0vW2zhi14X6Cq0YKnSAlQmKmUZ2uICCq22BJrER2hqdcle1Dj5RSpTgjneyK7ILnirG4jdWYKwtWWIH3OWZGHt0AXwbrSe/GR7M8pALpfku6IlUCRplzhXPnx+54a3Vng9cF4kw6pt5VmIVc1r6EmokN5Q9Vo/jRVSObRVDvIw75NC7vAnntK9d5J+OZNljBlr/7y7JWvlXv85pXI+xihq8QenQHxTQTn3mEwqyn6wD71YM0m9iKlReDQF4qJC7h+aFpsc8TelLXsGiVSsjcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 09:31:32 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 09:31:32 +0000
Message-ID: <2a4e88cc-75ee-4edf-9503-7f45b66b8c03@intel.com>
Date: Tue, 21 May 2024 15:01:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/guc: Allow to initialize submission with
 limited set of IDs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20240521092518.624-1-michal.wajdeczko@intel.com>
 <20240521092518.624-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240521092518.624-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d25e6b-f81f-4cd6-0a07-08dc7978ccdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBLNERlWkhFTElGTG5rWVlscGN5QU9tVUd1SGVOOEgwVHJPaWJZOVlLNG5s?=
 =?utf-8?B?cTYyc2lmbDFGQVNLN245SDIzYjZPLzRwZGJRL3lJTjRJTkhrdnRNdXpsais2?=
 =?utf-8?B?VXFIK0wrdCtlS0trYmZWRkxJN0UwK21TU0k4di9HMzUvdTBZejkzZTl6dXpi?=
 =?utf-8?B?ZWRwOXU5aWpmTm5uNVNWK3MrWG1SeWhWWm4yMFlaWVVCN3pHai8rR1dHd2lq?=
 =?utf-8?B?b3Q1b1I1a1l3SDRmQXQ3TlllZVltcTBFZEZFNW1WeW92bWRVdlpDUGFzV0xS?=
 =?utf-8?B?bGc5TDJpTkNINXhZWHBWK0NnY0dNaXNPRXVRZllTOVNGRkJrZ0xIc3VUblV5?=
 =?utf-8?B?Tk9MUFFCcWJ6YVVvc2JKcEtlWWphdFpFeXRpSU93NU1DbkV3Zis4TWJycVZ4?=
 =?utf-8?B?ZGF6M3lORXE3SS9aZW5lQ1dha3FjWit6dFk0REhrNS9qRy9qeVRTNGZBMm9y?=
 =?utf-8?B?SkJzbldaRWtpRWlackFZMVB1YzRrNWxTQUVVOEdvci9NWlJQb2k4L293WHly?=
 =?utf-8?B?K0V4eksyWlJ5OHlpVzAyUkxVOWRXamQ2aFhlcEwvSC80VWtONForK0dVSjVr?=
 =?utf-8?B?NVlJeHo1S2VHekc0a1FpQ04zT3dHcnEwc3BlNDZmR2kybDRJVU1GV2NiQnJI?=
 =?utf-8?B?OW9VN0dRdFB2R2x1dnRONjdXMGR1S0h1cjVsYkdhYytER1M1em9DdUNnaHR1?=
 =?utf-8?B?azlZclFtbnh0UE8vbGZtZk1Wb0JDZFBtcjd0SVAvd0dORGFFY1pQWVdOaWM5?=
 =?utf-8?B?TWNLTStQU3k4RUJGYkNZcVF0UHpSNHRCU3pjVFBRbXNKVVNwUTY1WFJVSnNF?=
 =?utf-8?B?dXJ4cFpMT2ZRbUJsZGVWNjN1ZVh0R3U5U0ZxVGxNZkk2WVlwbWFEVzJMcFBJ?=
 =?utf-8?B?NXlIbHl6VGIrTDNnZ1pjakZHelluL3RMazVzSVE2UnBzRW5OMXQ3RUVnRzY1?=
 =?utf-8?B?YVdLZHZwclVoajlnN0JyNTJTTkFuQWZjaEIvWkZxZlJYV2RRSU9BWTVXcTBW?=
 =?utf-8?B?dnZCOGhtRzVsZm5EaVNod3RaM3dkQ201cGxib0xFdlZjM1RnQ0pZangwYyt2?=
 =?utf-8?B?cHJ3VDlHa0xDM2VzdzZDM2N0cWhSMVpkaUFtY1J3MjBGR1E3b1NpNlhuQmtV?=
 =?utf-8?B?Vk11OTJkMHh5Ynp5SXBrcE1uWjhneWRwYUJlNE5OS3FHc0ZPSjQyWk05NGpB?=
 =?utf-8?B?RGd5bk0vTk9VT2xiTzhkWmdlQWs5eFNLWi9tUnQvdXFqWlk0UjRLT2tNWHNU?=
 =?utf-8?B?b0g4K0RmK2huRG56MDE5TlY0cVhqUEFEbk14d3RXbnV5V21OcVEwc0pwZHBG?=
 =?utf-8?B?QnBEUERONVV3aGZoT3BaWEZWelRObENQbEQyZkJFckNYMHRTbTArcGlQaFpq?=
 =?utf-8?B?T1FBUTJRUmRsYm9jWEM1a0xFZlorS0MzdzBOUGVCSXZ6cUVkNFpGeU9lcFFx?=
 =?utf-8?B?K3JWZjdtQkdSakVYNmQwcW03RXpTRGtBQTYzSjlKUnVLRzZidWlqMmx2REp5?=
 =?utf-8?B?TW96L25XRkdoV3prY1psZlFmalJJbitHUTVzdmFzQnNFZjZmWXFHSk9kTFQy?=
 =?utf-8?B?VVlOQ2NSUHJ2QVZ0cUh4aW1sam4vL2ttVG1iWjdQeE5WUFZJbDQwRGdSRDFO?=
 =?utf-8?B?WnVpZ01ibXRSOXE1R1ZaTm9wVnJ2d3VPWjJPZkRYdzJCUjZ1N09kRERNQ2N0?=
 =?utf-8?B?ZFhnVFRhQkxsMU5uUUx4VFMyREJRN0ZSTDZrNjVTSEhIT0YwSERndktnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmlJOXpWajM0blk4N1BUSERBYm11SHE4U0huaThPS2p1d2FkczRXRWx1OTVE?=
 =?utf-8?B?cHRhakJqSVhqTWgvbzZybmtTRjB4SUJCd2dNK0daM2NWUEtOVVRXbCtmakNT?=
 =?utf-8?B?SlYzVXEwSDlubksyQ0NZdEQrUFhtMjZoU2FDN3g4Z0pjbXREVGc1S0I5N0p2?=
 =?utf-8?B?SkkzeU14WEZSMnVqQ0NTV2RlSDdvcUFURHpRaGxzZTNsSDdyclNlOFdqR1hi?=
 =?utf-8?B?cVg3RW81Vm1pRHpVSFFyeTkwcDNqM1J3Um00eWk5eWlWejRSbjFJMWF2UFkw?=
 =?utf-8?B?YUwrbXhSd3BoT1NxVy94bTRFSVVoYUNpRmd1TVA1bVJIUWJhM29JYmpKcFdx?=
 =?utf-8?B?OEZ3WkE4YTR4bTFpcHpndy9DTUdwcWk2QldKOWh4Y2x3UjhnMjBIQUp0b2M5?=
 =?utf-8?B?TS92dVJhQmdrR3M5Z0pVc2tJNGJ2bUpBaVhOakJKbVJBWXJ4NzBQUUxBUDVw?=
 =?utf-8?B?WFY2K1FmVzRwWG8zY05mRDE1Z3N2M0liTEMzTm91NXduSS83Vko4WllUcUlM?=
 =?utf-8?B?akordmloUkVnWUtLSXltQUdJbGtaU0pOZmFCQ3hzcnQ5b2Y5OVorak1qVTFY?=
 =?utf-8?B?T1JoaEEwcCtHdjA0NlBEaXNGV2U3UG1HM250TCt0bXJsd1VKZlQ3d29iKzJQ?=
 =?utf-8?B?b3JDR0FSQ1N4L0N0eCs5NTFEeTdFQjU0WlFvYnRnQ09JSkJzdjh0MkRoOWQ5?=
 =?utf-8?B?RVNOajhiOVBJVkdMWWFMN3YyVi8xc0Rsb2Q3SmlVd09kN1kwbWd4RkwxTnM5?=
 =?utf-8?B?OHluUlMwU0JmUGozS0R3VWFkek5BSTE3WkNCZllWclhlcTNURWZXL0xyMmpO?=
 =?utf-8?B?RWMwQ0lYOTkvZ2drakNteWhwa0lpRUQySFdvNkJDUDdPOW5QRFhmbDEwOElV?=
 =?utf-8?B?MUI1dG5wQ3VJbWhpT3N4MExPU2l3WkVxbi96SUZuUHJqN1B2WnBHSmk2cHJV?=
 =?utf-8?B?YWFxb0IrWEZUcGJDdmRkMnl3aXE1Qi9rb25zeFlYZ29KU0lyaXBmWjU3SWNU?=
 =?utf-8?B?WGdrbWcwSjNrWjRuZFVlYzg0Z2c2QXJtOWNyWlUrRWlDcmFFZFVKMUE1NGY2?=
 =?utf-8?B?VG1lRWMyYkxRNUtDMUdsMUE5clVzNGJzUmIwdWVaekp0dnpJSXVud2dOTk1m?=
 =?utf-8?B?QTZjell6TmNVY2NZQ3h2dGRMbGcxdXhEYkU2ZEE1VzFlbENYckFGdmtvRXFL?=
 =?utf-8?B?U2xwcXdyZVZORHBUQndpWmFYeHQ2a3d2S1lvcnRIelNpZnhLeGZnSVRrU0dz?=
 =?utf-8?B?c2NBbU9NTnBaeFpZa3JJVzZQM1h5amdlcDRqbXBuVGwrNWVjQStRV2dkSkgy?=
 =?utf-8?B?ajlwUTR6V3Z2TmplNWtodjZhMDloUmxhT0dsQWwxOUxFV1RiOVZiM1JrSHFl?=
 =?utf-8?B?cEhIQ05kakRLbFpoYmpublZWSk1jUlV4SG1DKzRiUzJTcDR0c3dSWUtwTnk1?=
 =?utf-8?B?dUtTdmJaQ0FZRE5xWEgrckpWNk96Qkpmb0NMSzV1ZzgxMGhNa2gxUGl4UHU0?=
 =?utf-8?B?NTNGbGJsRCtXVlBLU2o5cWFLVnNzcnFnUjFHUDRPdi9RTGtUcTlsRHduRjJY?=
 =?utf-8?B?TTRzTDFPZU15NXJ0R1dFV1JweTE0SlFyaWprN0FVbnZiWDlpTlBORTA0K3Fw?=
 =?utf-8?B?WUg5dmVrb2VpL0JHeGVqOG1lYzk4TnlMUjY3c3VlZWNjTGlzMllwdUhwRlky?=
 =?utf-8?B?UG5YWFQwSUhsU2JVZmJmQkJrQmoxVTR6UGhqSjR5Wkp4Y1VSVktsNXpOOCtH?=
 =?utf-8?B?RW5JWGt4bDYxZTI1MGlZNXJidFc3Y3NyVk81RFQ0TUxaRmZudkR6ZW13T1gr?=
 =?utf-8?B?R1VTRG82dkp0S2R0aHkwSUJaOVJpd3AxK1BIczZaUllTNW13MFh5WUE0b20w?=
 =?utf-8?B?dXFOTmYyQWdmdHZlT0MxREl4WTdhSjFTNWFLd3Y0ZUNVRWpDOEdCdHpaTjQw?=
 =?utf-8?B?Q05RbEdEN0lkKzU3NExwWnI3TGFGOWt0aVJTNEFaYjhoYmQ0NDV4SDF1ZHFE?=
 =?utf-8?B?emdPQjdSUHY5aGprcFgxUnRYVnFoM0RpdXZydGNLRFhnbENBdHFCbmIwVElL?=
 =?utf-8?B?UU92bmlnTnMvWnF3OCtHVEhTZ3pmTUtFTXVRd0s0U0o0Y3ZZbmRLYTlGd3pX?=
 =?utf-8?B?U2JPWGJzdWdFUHdBNUJpaUJNUzNtNzhuUnVTNjZySE1td2o1NWZvV0RvUTFB?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d25e6b-f81f-4cd6-0a07-08dc7978ccdc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 09:31:32.2602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/Fwu2n0XJ+j6P3G5J36qhRZIBQEQRteYXCA+T8no/8jyAnY9r525pqdW+z5er0wH8mqBhiEz8IiLusF+1brCm8+2LEMN+U8l6ocU/xLbMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
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


On 21-05-2024 14:55, Michal Wajdeczko wrote:
> While PF and native drivers may initialize submission code to use
> all available GuC contexts IDs, the VF driver may only use limited
> number of IDs. Update init function to accept number of context
> IDs available for use.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: add kernel-doc for xe_guc_submit_init (Himal)
> ---
>   drivers/gpu/drm/xe/xe_guc.c        |  2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_submit.h |  2 +-
>   3 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e52b544ac690..807ad53449e4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -358,7 +358,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>   
>   	guc_init_params_post_hwconfig(guc);
>   
> -	ret = xe_guc_submit_init(guc);
> +	ret = xe_guc_submit_init(guc, ~0);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4efb88e3e056..13ec171ada1b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -278,7 +278,20 @@ static void primelockdep(struct xe_guc *guc)
>   	fs_reclaim_release(GFP_KERNEL);
>   }
>   
> -int xe_guc_submit_init(struct xe_guc *guc)
> +/**
> + * xe_guc_submit_init() - Initialize GuC submission.
> + * @guc: the &xe_guc to initialize
> + * @num_ids: number of GuC context IDs to use
> + *
> + * The bare-metal or PF driver can pass ~0 as &num_ids to indicate that all
> + * GuC context IDs supported by the GuC firmware should be used for submission.
> + *
> + * Only VF drivers will have to provide explicit number of GuC context IDs
> + * that they can use for submission.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -288,7 +301,7 @@ int xe_guc_submit_init(struct xe_guc *guc)
>   	if (err)
>   		return err;
>   
> -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, ~0);
> +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 4275b7da9df5..4ad5f4c1b084 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>   struct xe_exec_queue;
>   struct xe_guc;
>   
> -int xe_guc_submit_init(struct xe_guc *guc);
> +int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);

LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>   void xe_guc_submit_reset_wait(struct xe_guc *guc);
