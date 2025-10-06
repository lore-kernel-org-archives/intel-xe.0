Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED9ACCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 22:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD9810E4EC;
	Mon,  6 Oct 2025 22:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVXw2Aha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62C10E4CD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759791078; x=1791327078;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n0zjN9ZNE4Y68tlfxmt+LAJbeNcHSdt8DutJKsjP6wQ=;
 b=VVXw2AhaRPILtQ6eo1qsaBByI1Q9Y78jvRMpZZ9+aHQfJE0pwpXzTqvd
 fUAqtByEWDDyVs6/LNHW3QTqOFZXSmxFp9GDAwEomFggMCyEoS1t50kZO
 EFiw2X7JVj2RbZLK6kUJ02hTAeCgpMIwGXcwuoGI4ecrz+/ilG3nAlg9X
 i1qNsfStm/XzTA81NeFjuLzF32EUVwoeDe7KfwSZ4o6oEqYt3wRKUkji1
 Xq3610b+tWjblPOp/jQQ8lVRhCQEfQqm2EKDxYXYyogWCF//eizdRoOKe
 dvGGffRiFhCpV5KkOH6pbFqC3mJpgU5v8G1mP4lLXhUmLUovZOgQwSqKd A==;
X-CSE-ConnectionGUID: tAG29MLoSPiZ6ow6nCIIpw==
X-CSE-MsgGUID: MBwxwtMSRGKC0obR9ylIJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61680670"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61680670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:51:18 -0700
X-CSE-ConnectionGUID: gTKQbj0HS5G+Y2Rtjx6uYg==
X-CSE-MsgGUID: 54n6xlc5TFuWr/4K7/Y3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179812440"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:51:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:51:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 15:51:17 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IT0gcW7WTSojh1YX81JqXgf6OCpdZLZOpl1q1ySNZhpsmH2SqqmZ9THRkhzdSjk7SGAV9mGhtCY7ikMRtFj0eCz/LY5zoAcWNeIePKXreGDKl8souRbOxELakUizZzs2dN9kB9WY4x3m7qWLR6lYjsxbl3Xgz7PkJiEZBEtlxkczXKnhGH/hsUrHNSgkmLJbbs0t1/uPLk9ypAdocGK+f2UaX3eEyAhI1HAL334V/CdIcSMUmR81CBDKrZ58P48psJ7EVZhNco0I7AZzUoN+lyNK6aXErWsQEHKhxzRe6IKsYtvOmmabjut+Jdu1x/5/slRC+9IEyIKWjyI8b+z61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB4ucvhxLfQQY2CDUwbkawIopPsGj/1iml43+qkKWM4=;
 b=nuYzXYoWdXgtUcY4sQtzzmm1z9whhubqY2n6b61zEqy9LMKmlZEyJymgYzqBOy29YXbqzPw9AiGIg6dDdod/KAvZmHKVBkWbt6dIIUja63gckgsLIdltcAkL0b7/qnRsF2yUHkeBj4gn6jZOZeg/YhMVKiORALUFLv1pcNeuJAUTzgnzWSBTACtHZI4obScyL7o4A2hNAMz6zzabbVJ4z3e2BiA+h49IAIEG15vbGXkpHmJtRjAkKOwDszgu2LAq6FEKIFcIDyQ/98e3PpzCUGu1lgg92Xu0gGHt6x7ZwErUjEdDgpGC5KONPMniHsWiITkjgvD74Mw6Jsn44VxtWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6369.namprd11.prod.outlook.com (2603:10b6:208:3af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 22:51:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 22:51:14 +0000
Date: Mon, 6 Oct 2025 15:51:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <aORH4NrjGSNcCxi/@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-28-matthew.brost@intel.com>
 <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b28276-25dd-494c-2a96-08de052ada2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnVqbndkSysrRFhIYUFrNmJ2eTAvTlpKQXJhSVpFUGxIMEdjd2ZtYUxGYzBN?=
 =?utf-8?B?QXg2WWVIeERDdUtMNHErYnBzZDV2aTdkd1I4c2grU2IvTVR6bE93YnVkN2Q3?=
 =?utf-8?B?MkUycDFDbUJTRTJFSTg1NG9IVFQ5UWpZQzg4d3NzQVZ2YVY3NkZwL1Y3UlFs?=
 =?utf-8?B?VFJJOTl1VlZ0TmdPa3ZOcWhOMGYyWm5GZDM3eFlDc2dyNWFhaHhkV1BMdDdC?=
 =?utf-8?B?TUFJWHlsMmRRMFNLajV4S3RxV3pEQnVsb1d3TktNc21VK1FMRi9qOUZWQjVV?=
 =?utf-8?B?T2loT2RGVVVoZ1psbjRrVDhkSkRzME1takxqRmQyUVozY0gyc3RURzNpcW5G?=
 =?utf-8?B?RW0wOWdhN0EraUlMVlh0L0paRDMwZUYxUVhvdmxXVENpWnpqNTNxMlhyamxx?=
 =?utf-8?B?NFpTVEErQVlSc1dycjlsVjVrMGlEVWxTY2dnc2swNGdHTlZ5Ti9qRnowYU9C?=
 =?utf-8?B?V0hnOWVqL0o2aVN2ZCtyT09XUkFxMUE2dmVzb1hxQTlweWxMZFJSUFhNdWt6?=
 =?utf-8?B?RllTMHl2NHNLajFrT1RlN1paWXM1ZWROM1lBS3YvaDBDcXRLdzAwWVdwZXVP?=
 =?utf-8?B?a3JWRG5QWnlFSmJ3NWlnTmg3SGhFUEVkcFRJaU1BZThPU001T004bE93Q0Rq?=
 =?utf-8?B?dENybUJmdzlROXovZHhwUEw1V2F5aHpSazhYYVZEZndlMWJOVU1xVGZiWVEr?=
 =?utf-8?B?TjZWeU1FVWFEMEJwRmlGYWNscXFEUU5UKzhMU3dVTTE1RFllSXNIeWIxQVlE?=
 =?utf-8?B?QTZWZUIwWUJLQ0ZiTlF0Q3g5UXZyYWxWZG5rZFFjQzBXNU9YbExqd1BubnB2?=
 =?utf-8?B?dVhtWC9ScC9wdnA2c25wbXFWdUd6Z1NKdHVMc0w3Q05KRVBueE9oR05hVWlk?=
 =?utf-8?B?UkdPb2xDL2ZMRDRKbmExbzdaZzRaSUFzNzRtNUFzd0d2TFBGRy9CWkFZZGdY?=
 =?utf-8?B?MkJLUzQ0aFhoc3FCanQ4OStoelc5R2lNY0ZLNm1QcStCbGVYelk3aHc0ZjR5?=
 =?utf-8?B?dkw2YVllcVlFY1BEY1VBUGhaQTAwa29BMitUUEYrWDRQczFkN3ZZdDl5ZkJY?=
 =?utf-8?B?QmRhNmthR2lyZkFMYlVKd0RGYUp4YmxjRDFqUm9MQldTUU1iUjBKVmFZZmhw?=
 =?utf-8?B?Zkh1VjBzMWI5eDR4V21PZFBtTmx1UmkvVlhBZEtBMk5PeVNseTErRUJUd0J6?=
 =?utf-8?B?aUxTeHA4U0U0NVlzTE05MWwrSWRaV3Vkd1Yvc1J6VG82em9xYTg1b2lRTDI3?=
 =?utf-8?B?bXVVUkxFcGk3Z2F1NU9JYU44dXZuRnhwSGY5M3gvYmQxNWhyQmFtWTdqdHNL?=
 =?utf-8?B?WmV3azJHUkludUNPQ1kzQ3RGdkozVmRpK1ZGbHlKbldLMXd3YXpXc2JLN3pY?=
 =?utf-8?B?QXJHVVJZM1JUaW9pdks5WWRBc0JGTE9xS291c1pjZFp1MDB6Y3VjbldqQURU?=
 =?utf-8?B?a1BDMkFRKzlhUWpxYUpHQVZ6RkpkT3pSbUhvUlhDVkgxeFM2Rm8xYlJveGpk?=
 =?utf-8?B?NjgyKzJqTG82ZFFRYkh4MkRsT0wvUU84UDB3VGlTczJXNXVYVnhyVFVhZW9U?=
 =?utf-8?B?Z2ZnYUxDM1pFbk9HdHdoaWVjV3pZeUNlU3lGS1NQYzN3OXRtZG85T0VuTUdX?=
 =?utf-8?B?R0QzdWlMcllEdjZUbGtJNlRaRDBnZ2FYdTJvYnRuN2YrMVMrWENCeDNXM0tx?=
 =?utf-8?B?b1JVek12Qi9JdHVXSTBpMEVuYU5MTlNXL1EyK0EwYkE1cjF6MDJnRm5LdjND?=
 =?utf-8?B?ckh1MS9waXh1QnBTUDdXbW1oSUNMVkd2WHcxbVlPMkNlSDBkVDBrMkRPRDl4?=
 =?utf-8?B?c3VheHhpRXB4ZWZGUStpZ0hFUEtDd0xzUW1OZHRwNitxeTdvdTZzQWxNYVBz?=
 =?utf-8?B?RmU3R0JFTDZUMXc3cjFSLzNsYU9NTnpRRTRTM1BnSWRyQVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm1SWUtocUhpZ1dFZ2FRRGZqVlVyTmhTMWdUOXl4QkdDcmpyOERHTUw0T1kv?=
 =?utf-8?B?ZHBKSWQ4UHNKR2k3WjhzNnRDWnpMMWpxZFZ6b29hQjd4RzJKam9YSGRHVkNH?=
 =?utf-8?B?Nmw4cTF5RTM2UXZvSHpPWUdTektubXNEWVBoRWl1ZUUxNnQxSlo2UkxSSDla?=
 =?utf-8?B?OEFrK2FXS29WRlJGaWV4NFJDZ25EeG9RUm5KZ28vQ2J6SmNaelY5bzJVVG45?=
 =?utf-8?B?ajlqMHBrUUtOd20wb3RNT2lMdmYwM0pWL0JrRGFpUVhoL3k5RDRoS1Ixc1g5?=
 =?utf-8?B?Wk5wSmRFVXd5cFgzOHNIVFlRTXlNcE04WWVSVjgzb1BjOHZWc1pabHN6T2pu?=
 =?utf-8?B?L0oyK1ZqRjAya1Z6UTIvZFVqVEkrRmViSC9DRXFHVjN6eWIrOUFrQkFYbEJ1?=
 =?utf-8?B?SFYvWDdXbEdXcXFXaGcxeEd1WXEweWkrOSthRnZEWjZ5VmxPZHl3NHZkZjBV?=
 =?utf-8?B?blIyK0FvRE9RTHRxMXk0eWw2ZjZod1dyNzNhbUNnTGhPMy9mRWdtNnUwMEh6?=
 =?utf-8?B?RGt2SDJaTW40WmtUSFM0RFpoODR5cXllZU5TNXBaNVBUSzlRcGQ5SFVPSzZt?=
 =?utf-8?B?UkhHYmovMk9DcEMyNVVUTElEVXYzU2svYU1mRG12cXQ4RXh4R0RqVW9rMXJ0?=
 =?utf-8?B?bm91NTdzL080L2NvenE3ZmgvZ0lOVDJUR1pmTmY0cDlnVDRiWWdqaGxaaFEx?=
 =?utf-8?B?cmk0Vk9uS09icVFCNUQ3OGc0Z1o2eVdJL3RYd0dPQ2Y0VEVId25BWmloZGpN?=
 =?utf-8?B?QWMxcGpxQ0hVSzFyMzR4QlBDd1lRSWVTSWY1VyticisxQk9iYnZsZCtRcVJa?=
 =?utf-8?B?L3JpUjFXSWlTSlZxZGNnMC9DK0diU3VaVjY4dXdrOFdaakIzNkJQalRha3dk?=
 =?utf-8?B?SjRtc3lWS1BEckZhZHlFRHJ4RVR3c3RJTVFJZVdhOUVxZHdrYVl4MVBkYy9R?=
 =?utf-8?B?RUM4SW5rUG8yRFdmc3ZGMnV2cVdJSUJFYTJzOWY2cktEUHR0cDM1YTlpd3pB?=
 =?utf-8?B?L0Y4cUMxS0JUME1KcUVOY3BiZ0Zxc2VINU03ZnhLdXBXMCtkYnN3dHZ2Q2J2?=
 =?utf-8?B?TWg5MU81VVRvVjJUekxSNEZvMjVjMGw1UDRZejBZN2w2ckMrZjgrbUVaQTVF?=
 =?utf-8?B?OEc5bG1sSlBqVlNNMis2SE80QnFOYlFETzV0aGxaOG1DUDF2SVQyMm95bFpw?=
 =?utf-8?B?WUd4ZHhkNWQ2bkdaK2hQK2toRmdQUlExTXFXdHc5V2lnTk84VS90RjhKa2lm?=
 =?utf-8?B?VTQ4TFVMTzhSZUtjbzRXZ0x5aVpXdnNPQmlWUlhUZkFCTU1SZGVmK1liK2lv?=
 =?utf-8?B?dkVxTWFKMVM0TGpSRG9acDhmcVZCVlJ0RDJ3SHp0QnJQd2tHckxkVGtrVENN?=
 =?utf-8?B?cGwrMmZMZFFtR0hBNmJHc24yQkFoOEFjR1V0anlYSzZlOG1SY3YwV0d4cXlG?=
 =?utf-8?B?UWIwZXVMaGF5ZndCZjdMNzViRmVJUVFEeUcxYk1HQ2JCak16T1NmOVMrN2dz?=
 =?utf-8?B?K3FXSkZoRmN3clBCdzUrdElyWHhaUEhrVW51Mjh1Y1cwUlR1YlVDM09nQUZ2?=
 =?utf-8?B?aDk4LzNWREJnanlKb1hwYXA2WCswVjlWOGZ1MjNYZkdKR1JCRkNsQnFpTThZ?=
 =?utf-8?B?TC9GSjhKbkdHcEdtZlJZcmlCNytEVkNLSnJTQnMwV0Q1cG5kcVVGeW5oNnRj?=
 =?utf-8?B?OFVUcW0rZ012bFN3Yndaejlzbm1udXlmWVExb1NUcGhKZndDV1plZXJLUlpi?=
 =?utf-8?B?alEzblRBdjNWcmp5USs4QlBwOE13UHlRcHhhQzczbVBIc1FUeHlwYlYzNGJh?=
 =?utf-8?B?QzVsVXhwZWhMNktMdmJRWkZYbTN0cEYrdzhjUFd2VVBXSi8vOG54WHNseG1x?=
 =?utf-8?B?czR5b2Zia1lwdkJ4dFJvZyt4UWVOWXhNVFZLMitFSy9nblJLd1dLekxENDVI?=
 =?utf-8?B?QTd0dm5rMWlmRjlDbVFncHVuR3IyUitXdFJIdVp3SXhyZUo0L0VreThYVEhE?=
 =?utf-8?B?cUEwSitsUXdvNVE0b2ZtTU9sWEcrajZ1M21zSjBOOVh6dkNlckxFa1ZCVk5K?=
 =?utf-8?B?bFJrSm9hei9SZFlWWGdsQTh2aDVYR2pveFdPOXRxdk81T1gyYWJmTHBLNWhB?=
 =?utf-8?B?T0tGMitVbVRhQndoQ0I0dkZkY3diVTN2bnBXOWs5L0tCcng1bWp3LzRtbzFr?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b28276-25dd-494c-2a96-08de052ada2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 22:51:14.1876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIBgix/rezVS04sCF+Uonvg5CyLmM8yRnTPMxzvt7kAsrl4lbKT6EfmJrE2g1J0yj1yrQ+aEer7ZFZ5aXooR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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

On Mon, Oct 06, 2025 at 05:24:55PM -0500, Lucas De Marchi wrote:
> On Mon, Oct 06, 2025 at 04:10:35AM -0700, Matthew Brost wrote:
> > VF CCS restore is a primary GT operation on which the media GT depends.
> > Therefore, it doesn't make much sense to run these operations in
> 
> I'd need to double check the previous patches to see the entire
> picture, but this seems weird at a first glance. The VF CCS restore is
> not the single work we queue in gt->ordered_wq.  To me it seems more
> like "in what ordered queue we are going to queue the VF CCS restore. If
> it's global per device, why are we not using the device wq rather than
> making all the GT wq point to the same thing?
> 

This is where things get convoluted. Four mechanisms manipulate the
scheduling state by starting or stopping the DRM scheduler:

- Job timeouts
- GT resets
- VF restore
- PM resume

All of these paths require mutual exclusion, or the scheduler design
breaks.

The first three ensure ordering by scheduling on the same ordered work
queue (GT-ordered WQ). The last one is guaranteed by holding PM
references in all the right places.

Another issue is that the first three items are all in the reclaim path
— the GT-ordered work queue is designed to handle this.

This patch [1] explains the entire scheduler design in detail.

Only PTL has the cross-VF/GT restore ordering requirement, so I figured
the path of least resistance is to just point all GTs to the primary
work queue.

[1] https://patchwork.freedesktop.org/patch/677980/?series=154627&rev=4

> > parallel. To address this, point the media GT's ordered work queue to
> > the primary GT's ordered work queue on platforms that require (PTL VFs)
> > CCS restore as part of VF post-migration recovery.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> > drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
> > drivers/gpu/drm/xe/xe_gt.h           | 2 +-
> > drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
> > drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
> > drivers/gpu/drm/xe/xe_tile.c         | 2 +-
> > 6 files changed, 15 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index c66523bf4bf0..02c04ad7296e 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -334,6 +334,8 @@ struct xe_device {
> > 		u8 skip_mtcfg:1;
> > 		/** @info.skip_pcode: skip access to PCODE uC */
> > 		u8 skip_pcode:1;
> > +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> > +		u8 needs_shared_vf_gt_wq:1;
> > 	} info;
> > 
> > 	/** @wa_active: keep track of active workarounds */
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index cf484a2da35e..05465f358c96 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -65,7 +65,7 @@
> > #include "xe_wa.h"
> > #include "xe_wopcm.h"
> > 
> > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
> 
> If using the device wq is not an option (possibly because it would queue
> with other undesired work going on there), then I'd rather drop this
> bool passing here and make the decision inside this function:
> 
> > {
> > 	struct drm_device *drm = &tile_to_xe(tile)->drm;
> > 	struct xe_gt *gt;
> > @@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > 		return ERR_PTR(-ENOMEM);
> > 
> > 	gt->tile = tile;
> 
> 	if (!xe->info.needs_shared_gt_wq || !tile->primary_gt->ordered_wq)
> 		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> 	else
> 		ordered_wq = tile->primary_gt->ordered_wq;
> 	if (IS_ERR_OR_NUL(ordered_wq))
>  		return ordered_wq ? ERR_CAST(gt->ordered_wq) : ERR_PTR(-EINVAL);
> 
> 	gt->ordered_wq = ordered_wq;
> 	
> ... or something like that so you use the xe info to decide it here
> rather than passing it down as a function arg.
> 

Sure can refactor this as you suggest.

> 
> > -	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > +	if (use_primary_wq)
> > +		gt->ordered_wq = tile->primary_gt->ordered_wq;
> > +	else
> > +		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > 	if (IS_ERR(gt->ordered_wq))
> > 		return ERR_CAST(gt->ordered_wq);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 5df2ffe3ff83..9545c0c93ab6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
> > 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> > }
> > 
> > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
> > int xe_gt_init_early(struct xe_gt *gt);
> > int xe_gt_init(struct xe_gt *gt);
> > void xe_gt_mmio_init(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 3f42b91efa28..25a1d96a68e7 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
> > 	.has_sriov = true,
> > 	.max_gt_per_tile = 2,
> > 	.needs_scratch = true,
> > +	.needs_shared_vf_gt_wq = true,
> 
> as per above... I think this needs to be detached from vf. There may be
> other reasons the wq needs to be shared.
> 

I’d prefer to share the work queue only when absolutely necessary — such
as when PTL is on a VF and migration is supported.

> If we just make them point to a device wq as suggested above, then
> there's no extra issue with the ongoing work to disable GTs that Matt
> Roper is doing (https://patchwork.freedesktop.org/series/154739/).
> Otherwise we will need to think on how to reconciliate them.
> 

I don’t see how it would ever be possible to disable the primary GT and
still do anything meaningful. You can’t allocate memory (e.g., for
clears), perform VM binds, or handle page faults without a copy engine.

Matt

> Lucas De Marchi
> 
> > };
> > 
> > #undef PLATFORM
> > @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> > 	xe->info.skip_pcode = desc->skip_pcode;
> > 	xe->info.needs_scratch = desc->needs_scratch;
> > +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> > 
> > 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > 				 xe_modparam.probe_display &&
> > @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
> > 		 * Allocate and setup media GT for platforms with standalone
> > 		 * media.
> > 		 */
> > -		tile->media_gt = xe_gt_alloc(tile);
> > +		tile->media_gt = xe_gt_alloc(tile,
> > +					     xe->info.needs_shared_vf_gt_wq &&
> > +					     IS_SRIOV_VF(xe));
> > 		if (IS_ERR(tile->media_gt))
> > 			return PTR_ERR(tile->media_gt);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 9b9766a3baa3..b11bf6abda5b 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -48,6 +48,7 @@ struct xe_device_desc {
> > 	u8 skip_guc_pc:1;
> > 	u8 skip_mtcfg:1;
> > 	u8 skip_pcode:1;
> > +	u8 needs_shared_vf_gt_wq:1;
> > };
> > 
> > struct xe_graphics_desc {
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 6edb5062c1da..e9bcff2de563 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > 	if (err)
> > 		return err;
> > 
> > -	tile->primary_gt = xe_gt_alloc(tile);
> > +	tile->primary_gt = xe_gt_alloc(tile, false);
> > 	if (IS_ERR(tile->primary_gt))
> > 		return PTR_ERR(tile->primary_gt);
> > 
> > -- 
> > 2.34.1
> > 
