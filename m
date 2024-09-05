Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A144CD5BA9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 11:10:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6930010E857;
	Thu,  5 Sep 2024 11:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIAliNDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1360510E857
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725534652; x=1757070652;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZhagB/IOITqimJYFDHNP53YMcktRwTz2ptDTB1bJQfI=;
 b=cIAliNDneccPAyGRTBy3czO1t7yOuWpo0T6WsQOYFnlPbhxwrfKWGEir
 WliK8KZPkVn3DBvOvNwgsQ4Yk7dgN8ye2xK+WXpsS0Ck/2olvBpXV9hwt
 5Jz93uSj+JOdGv2Gbc3xiXZ2Ir0lmnpBeefx5/lpZJ7inVhleb1sMDGiA
 tYbPp5uUFB6Lp+7gzK+NV9pYxw+mH9yfbqXEbCHaQzJ9pnbLLgxvoZF5I
 cjMz7QDeEu6cx+MzxO2OmMIzirwCU/9lJooY9C0ESHR+mG1jXyPzhZZxn
 XWaIjbeW8lSvjWkaVdueONEuC4lMXdr2Lh3XRzFLJKgwucUIkI3DiFo3Z w==;
X-CSE-ConnectionGUID: DuFLWlnNTtuDwnaRO6quUg==
X-CSE-MsgGUID: LXACjWMvR3a3gRdDcufaMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24195921"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24195921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 04:10:52 -0700
X-CSE-ConnectionGUID: DNgu9F/jT5OisuCHqWg35g==
X-CSE-MsgGUID: +zYInZx9RxGcG4NFZItpug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70008344"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 04:10:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 04:10:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 04:10:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 04:10:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 04:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW8bW1BF/FC892ymIJ6bQBNRAhhub9Mvk/HY8VHF9nZWi9YjjonG4Kfesahs8dptZDauneWOQwF2hTtBiJ4AQPBHOvca2hkQPl0stuyTFPkTmNhBmKfsa/oxqrRWESJR1Ch5eY/3wns7+y8uVN48irnUkqGwXJf1jLoS2KOM0z9BvZJuqP8QU6B+3wMZnoZ5g4/c3wjgAepRh3ozZdofiqivzZJO2H7bBfHYD98SvnJtS1wwcwzCSjMlV5l8/0idUp+Ky4Vc2XT4DoDELu56z8R7CjLRjHFyH5+0zWe7mvSLmuMHDLpx/iq0ZPsVH4o62drVBw2AXnsnXcgFQIt/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mei8rG2hxRlKR295Qpbm7lMYOyLrTgwwWIkeJdBycKI=;
 b=NsVP997dg8jPhTYkI8wezH+KmaX05UVmKdBt0hioKxCuy0NYI1jDTXhP5nUXZXhAzGECJJHWRwAAQ9xomiYJcNt5kZiAeMLN6a5NEbdNoB/vaJPnEIXi1Atx2qzgaAktIL7ftJFsaFtqK5/hyBk/2IvPLFK4oEPCNohYpMbZQsa5Vvg2T9ddozrBJQmuQNjtsRAYsWpQHsCIIPkW1StcEBEsXmnGVIrQGGhyYe6ExJqoVEm53P9NdoBC89/fR6chjFvYT29260WBsd1XyrM2Gm9dia0ItcSNCYW9+kSiaY8qGm0g5pG47TkLs1DnyXPnt/fffvH2eTKUspwVK+hCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 11:10:48 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 11:10:48 +0000
Message-ID: <00c5165f-4855-4b4b-bf2f-8bb0b799a3d6@intel.com>
Date: Thu, 5 Sep 2024 16:40:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/xe_gt_idle: modify powergate enable
 condition
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240905052813.4169007-1-riana.tauro@intel.com>
 <20240905052813.4169007-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240905052813.4169007-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SJ0PR11MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b41d9f-012c-4b2c-36cd-08dccd9b64eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3U4a2RxRWxBQkZzbTQ2SGwzYUZyY3IxUFhYenB5akNXWXJiK2RUZ2Y5ZTd1?=
 =?utf-8?B?c3NsSEp0c2xxMVJ6dUVGakhTblJvUXZaSnVTRHBzTUZobDJXbUJiS2cvSWdQ?=
 =?utf-8?B?ZTVJSm8ra2JKdjllS24zQXVybnUxeWlPZWtRQjRHcWV6NHZERFVQTnU5YXU4?=
 =?utf-8?B?dURRNWZzcmljNkIvQkI2bU5hUGVkQlZ5MndJeFhjazlaRnkvdlNvRm9lS3F6?=
 =?utf-8?B?aWNTUWpCV1FRcDRqTGZGejdBb0dtc3NNQUl3dmxNU0ZuakNqWkxmaXVPSjY5?=
 =?utf-8?B?S1JERE1xamVxZktGVENrUTl5TEtFNzQ3cWEyWGQ1M1JGUzFNT2h2VmxaOVgy?=
 =?utf-8?B?SW9OUWNaT3BHUXFkUi83WnBualB2TW1oT0dmdE1zcnZSVWR2Sm9EUGpVdUp4?=
 =?utf-8?B?a2ZERGd3SmI0RHFrQ21QOHN2blJvU3FNVkpxWHh1ZEErQStvTzgrWG1ZSDli?=
 =?utf-8?B?RlZEdDBKYjF6UjJ4VUJSZlpsUjdqbExCRVZrTk50MW0zTzYrUlhtN3VLM3pp?=
 =?utf-8?B?cXJBeVNUSmpTWjZrOFdmaGRnQU5vdFdXZ29aam81UExuY0FDNGRGTzc1MmJR?=
 =?utf-8?B?cXFsbVZKcTB0bWZsNGtSZm1qeU1sK3kycG1YdGVZMjJlYnVuRHpYUzl1SHJj?=
 =?utf-8?B?NU9CSERnemZaampxa2M0c1B2VEhnQnFGWDA5eUdnVDFlcElwVmJTVllSSGJT?=
 =?utf-8?B?YVhoZWxYbm5hZDBjaGE1RGtReXdHd0VBU2M2UjRYQWhKc0wrMGlUZGRSQTFE?=
 =?utf-8?B?ck5YeFVaMDFyTGQrMHJBT1RkMDl4ejIyaktCNzg4QXZuQzFYZW9aMTBPVHA4?=
 =?utf-8?B?MysvWVpldFJMVjRxaFRaUFByRG91Q29JRTNtUEg2WFNNSXlpeXAvd0w4MGM2?=
 =?utf-8?B?YUxFbjlxeW03ZVNhaVpFQUxMSzl0d1BtRGpzYnpiUitIQ2x2UG9qOWlyTjYr?=
 =?utf-8?B?eXRWQnNwMjd3YXFNY0N3M3o4S2lUY1lIMDRKY1g1RmJkYnZYVjNDTCsxU3p3?=
 =?utf-8?B?b3pJdDFJWmJnUDgySHMreE5LKy9YeEVEVkJqV3o5UmdqNVRTWCtLMWVJaUcy?=
 =?utf-8?B?cEF1dktkY0RST2FVdTB2b3NzUkxUVGpnY0lBZDJlK2IzZ05ndDI3NCt3Y0dN?=
 =?utf-8?B?blRlaXdFOXk3M3paSW5MSXJVYmxoRFVFZkhyaXZhZnhaeTJCeXRrSDV3am94?=
 =?utf-8?B?RnU2a0ZSQVJ5NWd5VzN6cEgvemxLM1VHakVxbkp6QTFoUEhMRzUxbXZabXVM?=
 =?utf-8?B?VmJtd1grQWl2aS9QdnRZSldaZjJqK2Ztc0RQcUlpY2xkUXlxQU1oTzNmb3N2?=
 =?utf-8?B?UHQ4amxENVNrWXI1VmR3YmJ5bHJZK3FlNDFLVWUrRlU2UjNjV1VPTlp1TzVi?=
 =?utf-8?B?V0Q4SW5YNEpyeU1oa2RDNndkSS85b1dCeGZtQWxUeHBuWVROOTByWFJMNnpS?=
 =?utf-8?B?aEhpRXllWUU1UVc1ekh2eXhpRmJ6SVU4SFpGZFlQN2tiVldBcHVPZkpqYi8w?=
 =?utf-8?B?eWUwS1hRMFJVc3RoZU82M3FNR2UwdEhOZWY2SGlWbFFSKzFPTExjREIwS0Yv?=
 =?utf-8?B?VnVrdEI1RW5LSFU5bmp2bXFvd3hSUlBkaDdTVWRtN0RvWGtTcWwvOE5vYjNp?=
 =?utf-8?B?bXlYaWxacXFmSzBZZm5MSnZlSEVZWkRWaWJTcm5ObTBpSjVkUDZEZW5hWnZK?=
 =?utf-8?B?d1BtS2o2UmIrTmNrbzBvd2ZrN3RxUnIwUGRlMWh5dDVrYTYzTjRDU0RDcFFT?=
 =?utf-8?B?R3VFYnJpUExjS25tZ1RwblJMWG1PS0lPWDJNS1hDdlkrSHBJZjdNT1ZMUGlY?=
 =?utf-8?B?T1JKRzBaQThFSXFYOERmUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1ZVcVZkOWRqQjY5TVBEQkxuUEY2ektid0VRVkh5Q0dJU054VHVteGIzWUx6?=
 =?utf-8?B?ajBreFBXRER1SitrWmJMRGZoc2dESDZRcktaKzYyQUtVemZJbUxuRm5mTjJ5?=
 =?utf-8?B?MHU0S29jaXRQT3ExbHY2OVdGbllKb2M4YVg0TGEzNjRVY0dnTUFUZzltSmFp?=
 =?utf-8?B?cVhYUUVtcTBxNE9FaFJieXBGKzJ0ZU9zVGx6djdqck5jR1NtRTFzWXQyYW9N?=
 =?utf-8?B?SkNpWUpGV1FxZzJibnNSVU9BR3l2R3ZXM3VvNk1JeXlFWDZTSWxMYjZCV2oy?=
 =?utf-8?B?TjhDUURnSFVZN1VCSHlZdlVhRU5wQkUybWsyd3hxNVprMFpxeElmSjUxNTBh?=
 =?utf-8?B?WDlpaTZCZlBvYnE2ZGZuVzdhQTV5bWxWd3dCYzdEZ2JxZ2Y3cGJFUExvSzdZ?=
 =?utf-8?B?RktkS2t4RnQ0Y1B4MDhwMHhFYkk1S0dPVXJWd2lnR3RpWjQzVHFtdVQzY0hM?=
 =?utf-8?B?bUN0VFBZcGtGV3dQSnpYMkRhL3FTeXlyd3ZSRWJ4K24zRkw1ZUJ2S0xTZ3Aw?=
 =?utf-8?B?eXd1U0FmWEdWSTNJbnNDbm1qTXJMdFpKRnhZRVAyRTV3UFFMMzVlVE5qakU4?=
 =?utf-8?B?MVJyeFZLQ2FnTkdmK21TNDh1U2wxakx5SyswbzBPM21tdWQwOGUrZDNoQlNX?=
 =?utf-8?B?NmdiNWJRL2JsdXJlSzRRLzJWVlNkSzQ1b2hZYU9hY2RkbGF5RG01QTkybW15?=
 =?utf-8?B?SXhiWTRwaXJNWXIvenJNV2xZMDZ2UTZEUFFsYVYzVW84bXR3eit5ZzA4amls?=
 =?utf-8?B?d3pJYVovd3FSbWRWMU9nVG9IRHZqZWsrd3Ixc1JsTmUyMGlLTmRLQ0QvR2xK?=
 =?utf-8?B?Tk1ZL1NJd05YTmQwZDNkTXRvczVzWFQ1cGJDeTdvc1pGRUdES1dlK3dqWVR3?=
 =?utf-8?B?Z0F0Yis4citKcmJaTnliRXFGendMTEhLTWhyZ1JVMTM5eTRDNXZrWjlyQmtF?=
 =?utf-8?B?NXRiQnBXaGlYWWxDVUpwSDM1Umw0Y1ZUakZ1TXQzaWRiOHJQUVY5SUppVklI?=
 =?utf-8?B?MWdBRW1yS09qcGhWbG5sa2FrTlRKSkhMTTFPUUtPbnd4R3YzUXZ2RXN1eHdU?=
 =?utf-8?B?MzNnZEN6ZWs1V0ZPeHdzMVRQN0pmN2xCZFlBY2wraEFHcm02RnVSWU9MWWpi?=
 =?utf-8?B?aXc5NERVZXZMaE82VXlLOEVLQzRaMzY2L1ZPSXFDazNUa1VEWjNqTGcwdHdj?=
 =?utf-8?B?U3RRS0Vid1pzS1lKQm5ITm1nU0QwdkNEaUhmNTY0UHJyQ2xCVVN6N3pUd1FQ?=
 =?utf-8?B?bDJyOVg1RXJYRVAxUERNa2NMbGYxMDdOWG5HQWRLbENwR3JYUVhpNjdtQjlO?=
 =?utf-8?B?L3dFd1B4RUVCVzNSNEFzRHpOcDdoVU9waVRVdDNKU1AxUTI3RmlIRzdUQWwy?=
 =?utf-8?B?emxaSWtsbVh2QlNxd1ZWaHkwMnBXdllHWFI1Vmk4Nld2eGNQWnRXdlBJdUNS?=
 =?utf-8?B?UnpOZ1haVEphN05oYXJEQlR3aTBNa2M1Z0h5YjZTS1pjTjkydXV3UXZzZVNI?=
 =?utf-8?B?dWZVcHU0ZWpOZW5SUmtZODNlVG9ZaWg4OXpqY0dsRVBuVHJJS2UvV1FYajNa?=
 =?utf-8?B?N2QrSGYwU2xtK0tCbDVvUURHZ1RsSDBCY3dRRjJHZmhPQWlpcWJBSGNXd3Fh?=
 =?utf-8?B?NHhrU3NHZ1dlUXBnRUpHcHJ6THZuby9rM1NFN3BZVDZiTXpHS1FnYTJWT25X?=
 =?utf-8?B?cEFqd1F3MFNUeU9YbTdXMWZXNmg4bTUzNlBrS2t4SnZaaTJEVG9taHlBbkM5?=
 =?utf-8?B?di9SV0Z1eTVKWnlFQmhyd3Y3RjdsQlN4a1Jhc0h6cXY2MGtCMXJEd2hQU21J?=
 =?utf-8?B?YWRxeDRjay95SmVaZGUxeXN4d3lWZkxKV1lDWDFKQlBYOStvZlZmeEQwOE82?=
 =?utf-8?B?Z3V6ejdaU2xrTzhmWFdrdDVUQVViSTVqaTYzVjZCNW1PakpVMG94THZJNWwr?=
 =?utf-8?B?aXZ6YmZabjZGOTh2V1RGTjhkaURlME1YUU1JSFFsOXc0QlhCRmtnNzhuOTdI?=
 =?utf-8?B?KytXb3NCVHRiK3QzQ3lkaGZIdzBkdFV0RUVTWC9ESGdrZUdvcDlxTm9lUWUy?=
 =?utf-8?B?TlQ3R2phYnQwdGVqUFRsWDlBSitYL0JPZG1YYWJRQWF1L1VhclFlU1dhTkVQ?=
 =?utf-8?B?dXJ3c2ttcURRZTdJY2RXZGNnUlRMbGJEUFlRb21xaU1pejY0RVNsN0IvSHRJ?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b41d9f-012c-4b2c-36cd-08dccd9b64eb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 11:10:48.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAdnJGQFsuhPf3tn91jDIWaNJtmhYZgRBiLLl3+WzubD0zUGOYn35XFFXbFJ2nWbMt7shBRAJ5eeng1HmHhz5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
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



On 05-09-2024 10:58, Riana Tauro wrote:
> modify powergate enable condition based on the type of GT or presence of
> media engines. Also have a copy of the value written to powergate enable
> register.
> 
> v2: add condition to enable render or media powergating (Badal)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c       | 26 ++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_gt_idle_types.h |  2 ++
>   2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 67aba4140510..3924f9f3d0a5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -98,7 +98,8 @@ static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
>   void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	u32 pg_enable;
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	u32 vcs_mask, vecs_mask;
>   	int i, j;
>   
>   	if (IS_SRIOV_VF(xe))
> @@ -110,12 +111,19 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   
> -	pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
> +	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
> +	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
> +
> +	if (vcs_mask || vecs_mask)
> +		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
> +
> +	if (!xe_gt_is_media_type(gt))
> +		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>   
>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>   		if ((gt->info.engine_mask & BIT(i)))
> -			pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> -				      VDN_MFXVDENC_POWERGATE_ENABLE(j));
> +			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
> +						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
>   	}
>   
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> @@ -128,20 +136,22 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   		xe_mmio_write32(gt, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
>   	}
>   
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   {
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return;
>   
>   	xe_device_assert_mem_access(gt_to_xe(gt));
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> -
> -	xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
> +	gtidle->powergate_enable = 0;
>   
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	xe_mmio_write32(gt, POWERGATE_ENABLE, gtidle->powergate_enable);
>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> index f99b447534f3..7a8e63f2ebcc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> @@ -23,6 +23,8 @@ enum xe_gt_idle_state {
>   struct xe_gt_idle {
>   	/** @name: name */
>   	char name[16];
> +	/** powergate_enable: copy of powergate enable bits*/
> +	u32 powergate_enable;
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   	/** @residency_multiplier: residency multiplier in ns */
>   	u32 residency_multiplier;
>   	/** @cur_residency: raw driver copy of idle residency */
